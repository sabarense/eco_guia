import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:eco_guia/pages/home/components/bottom_nav_bar.dart';
import '../recycle/recycle.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  Uint8List? _imageBytes;
  String? _material;
  String? _firebaseImageUrl;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final source = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Escolha uma opção'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.camera),
            child: const Text('Tirar Foto'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
            child: const Text('Escolher da Galeria'),
          ),
        ],
      ),
    );

    if (source != null) {
      final XFile? pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          _imageBytes = bytes;
          _material = null;
          _firebaseImageUrl = null;
        });
        await _analyzeImageFromClarifai();
      }
    }
  }

  Future<void> _analyzeImageFromClarifai() async {
    if (_imageBytes == null) return;

    setState(() {
      _isLoading = true;
    });

    final base64Image = base64Encode(_imageBytes!);
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:5000/scan'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"image_base64": base64Image}),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final material = jsonResponse['material'];

        setState(() {
          _material = material;
        });

        // Após obter a resposta da API, faça o upload para o Firebase
        await _uploadImageToFirebase();
      } else {
        setState(() {
          _material = "Erro na análise";
        });
      }
    } catch (e) {
      setState(() {
        _material = "Erro de conexão";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _uploadImageToFirebase() async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('uploads/${DateTime.now().millisecondsSinceEpoch}.jpg');

      final uploadTask = storageRef.putData(_imageBytes!);
      final snapshot = await uploadTask.whenComplete(() {});

      final downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        _firebaseImageUrl = downloadUrl;
      });
    } catch (e) {
      setState(() {
        _material = "Erro ao fazer upload da imagem.";
      });
    }
  }

  void _goToRecycle() {
    if (_material != null && _firebaseImageUrl != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Recycle(
            nome: _material!,
            imagePath: _firebaseImageUrl!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Center(
                  child: _imageBytes == null
                      ? const Text(
                          'Nenhuma imagem capturada.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      : Image.memory(_imageBytes!),
                ),
              ),
              if (_material != null && _firebaseImageUrl != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: _goToRecycle,
                    child: Text('$_material identificado! Recicle-o agora'),
                  ),
                ),
            ],
          ),
          if (_isLoading)
            Container(
              color: Colors.black54,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        onItemTapped: (index) {
          // Atualizar a navegação se necessário
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: const CircleBorder(),
        child: const Icon(Icons.fullscreen),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
