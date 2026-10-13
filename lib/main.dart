import 'package:flutter/material.dart';

import 'pantalla/menu_pantalla.dart';
import 'pantalla/ejercicio6_pantalla.dart';
import 'pantalla/ejercicio7_pantalla.dart';
import 'pantalla/ejercicio8_pantalla.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicios Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuPantalla(),
        '/ejercicio6': (context) => const Ejercicio6Pantalla(),
        '/ejercicio7': (context) => const Ejercicio7Pantalla(),
        '/ejercicio8': (context) => const Ejercicio8Pantalla(),
        /*'/ejercicio9': (context) => const Ejercicio9Pantalla(),
        '/ejercicio10': (context) => const Ejercicio10Pantalla(),*/
      },
    );
  }
}
