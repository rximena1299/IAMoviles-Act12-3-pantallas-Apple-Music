import 'package:flutter/material.dart';
import 'package:myapp/widgets/ingreso.dart';
import 'package:myapp/widgets/logo.dart';
import 'package:myapp/widgets/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/bienvenida': (context) => const BienvenidaScreen(),
        '/registro': (context) => const RegistroScreen(),
      },
    );
  }
}