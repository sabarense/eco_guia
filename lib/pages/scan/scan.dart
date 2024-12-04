import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:eco_guia/pages/home/components/bottom_nav_bar.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  Uint8List? _imageBytes;
  String? _result;
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
          _result = null;
        });
        _analyzeImageFromClarifai();
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
            _result = "Material identificado: $material";
          }
        );
      } else {
        setState(() {
          _result = "Erro na análise: não foi possível identificar o material.";
        });
      }
    } catch (e) {
      setState(() {
        _result = "Erro de conexão: verifique sua rede ou servidor.";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
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
              if (_result != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: Card(
                    elevation: 4,
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _result!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
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
