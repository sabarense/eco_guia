import 'package:eco_guia/models/user.dart';
import 'package:eco_guia/pages/home/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:eco_guia/services/user_service.dart';

class EditProfile extends StatefulWidget {
  final User user;

  const EditProfile({super.key, required this.user});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
    _passwordController = TextEditingController();
  }

  Future<void> _saveProfile() async {
    setState(() {
      _isLoading = true; // Inicia o loading
    });

    final updatedUser = User(
      id: widget.user.id,
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text.isNotEmpty
          ? _passwordController.text
          : widget.user.password,
    );

    await UserService().updateUser(updatedUser.id, updatedUser.name,
        updatedUser.email, updatedUser.password);

    setState(() {
      _isLoading = false; // Para o loading
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sucesso'),
        content: const Text('Perfil atualizado com sucesso!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Atualize suas informações',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 17.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha (deixe em branco para manter a atual)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _isLoading ? null : _saveProfile,
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : const Text('Salvar alterações'),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 79, 226, 175), // Cor do botão
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                textStyle: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 3,
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/location');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/learn');
          } else if (index == 3) {
            Navigator.pushNamed(context,
                '/profile'); 
          }
        },
      ),
    );
  }
}
