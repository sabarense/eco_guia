import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eco_guia/models/user.dart';

class AuthService {
  static User? _currentUser;

  static Future<void> login(User user) async {
    _currentUser = user;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }

  static User? getCurrentUser() {
    return _currentUser;
  }

  static Future<void> logout(BuildContext context) async {
    _currentUser = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacementNamed(context, '/login');
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  static Future<String> obterEndereco() async {
    try {
      // Verifica se o serviço de localização está habilitado
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return 'Belo Horizonte - MG'; // Retorna localização padrão
      }

      // Verifica a permissão de localização
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          return 'Belo Horizonte - MG'; // Retorna localização padrão
        }
      }

      // Obtém a posição atual
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Converte as coordenadas em um endereço
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isEmpty) {
        return 'Belo Horizonte - MG'; // Retorna localização padrão
      }

      Placemark placemark = placemarks[0]; // Pega o primeiro resultado
      String endereco =
          '${placemark.street ?? ''}, ${placemark.locality ?? ''}, ${placemark.country ?? ''}';
      return endereco.isEmpty
          ? 'Belo Horizonte - MG'
          : endereco; // Retorna localização padrão se estiver vazio
    } catch (e) {
      return 'Belo Horizonte - MG'; // Retorna localização padrão em caso de erro
    }
  }
}
