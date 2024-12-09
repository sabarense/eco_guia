import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:firebase_core/firebase_core.dart'; // Importação do Firebase
import 'package:eco_guia/pages/home/home.dart';
import 'package:eco_guia/pages/login/login.dart';
import 'package:eco_guia/pages/register/register.dart';
import 'package:eco_guia/pages/learn/learn.dart';
import 'package:eco_guia/pages/locations/multiple_markers_map.dart';
import 'package:eco_guia/pages/rewards/rewards.dart';
import 'package:eco_guia/pages/scan/scan.dart';
import 'package:eco_guia/pages/profile/profile.dart';
import 'package:eco_guia/pages/welcome_screen/welcome_screen.dart';
import 'package:eco_guia/pages/profile/edit_profile.dart';
import 'package:eco_guia/services/database_service.dart';
import 'package:eco_guia/services/user_service.dart';
import 'package:eco_guia/models/user.dart';
import 'package:eco_guia/pages/profile/delete_profile.dart';
import 'firebase_options.dart'; // Importação do arquivo de configuração do Firebase
import 'package:eco_guia/pages/itens_reciclados/itens_reciclados.dart';

Future<void> testDatabaseConnection() async {
  var factory = databaseFactoryFfiWeb;
  var db = await factory.openDatabase('my_db.db');
  var sqliteVersion =
      (await db.rawQuery('select sqlite_version()')).first.values.first;
  print(sqliteVersion);
}

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Necessário para inicializações assíncronas

  // Inicializar Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Configurar database para web ou outras plataformas
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb; // Para web
  } else {
    databaseFactory = databaseFactoryFfi; // Para outras plataformas
  }

  // Testar conexão com o banco
  testDatabaseConnection();

  runApp(
    MultiProvider(
      providers: [
        Provider<DatabaseService>(create: (_) => DatabaseService()),
        Provider<UserService>(create: (_) => UserService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<User?> _getCurrentUser(BuildContext context) async {
    final userService = Provider.of<UserService>(context, listen: false);
    List<User> users = await userService.getUsers();
    return users.isNotEmpty ? users.first : null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eco Guia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: const Color(0xFF185A46),
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          headlineLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/home': (context) => const Home(),
        '/location': (context) => const MultipleMarkersMap(
              mapId: 'full-map',
              latitude: -19.9191,
              longitude: -43.9386,
              locations: [
                {'lat': -19.9191, 'lng': -43.9386, 'title': 'Ponto 1'},
                {'lat': -19.9300, 'lng': -43.9400, 'title': 'Ponto 2'},
                {'lat': -19.9400, 'lng': -43.9500, 'title': 'Ponto 3'},
                {'lat': -19.9500, 'lng': -43.9600, 'title': 'Ponto 4'},
                {'lat': -19.9600, 'lng': -43.9700, 'title': 'Ponto 5'},
              ],
            ),
        '/learn': (context) => const Learn(),
        '/profile': (context) => const Profile(),
        '/scan': (context) => const Scan(),
        '/rewards': (context) => const Rewards(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/edit_profile': (context) {
          return FutureBuilder<User?>(
            future: _getCurrentUser(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Erro ao carregar usuário'));
              } else if (snapshot.hasData && snapshot.data != null) {
                return EditProfile(user: snapshot.data!);
              } else {
                return const Login();
              }
            },
          );
        },
        '/delete_profile': (context) => const DeleteProfile(),
        '/itens_reciclados': (context) => const ItensReciclados(),
      },
    );
  }
}
