import 'package:eco_guia/models/user.dart';
import 'package:eco_guia/services/database_service.dart';

class UserService {
  final DatabaseService _databaseService = DatabaseService();

  Future<List<User>> getUsers() async {
    return await _databaseService.getUsers();
  }

  Future<void> addUser(String name, String email, String password) async {
    final user = User(id: DateTime.now().toString(), name: name, email: email, password: password);
    await _databaseService.insertUser(user);
  }

  Future<void> updateUser(String id, String name, String email, String password) async {
    final user = User(id: id, name: name, email: email, password: password);
    await _databaseService.updateUser(user);
  }

  Future<void> deleteUser(String id) async {
    await _databaseService.deleteUser(id);
  }
}