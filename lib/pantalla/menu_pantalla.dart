import 'package:flutter/material.dart';

class MenuPantalla extends StatelessWidget {
  const MenuPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _boton(context, 'Ejercicio 6: Impuesto vehículos', '/ejercicio6'),
            _boton(context, 'Ejercicio 7: Banco', '/ejercicio7'),
            _boton(context, 'Ejercicio 8: Ahorro anual', '/ejercicio8'),
            _boton(context, 'Ejercicio 9: Adivinar número', '/ejercicio9'),
            _boton(context, 'Ejercicio 10: Intervalo', '/ejercicio10'),
          ],
        ),
      ),
    );
  }

  Widget _boton(BuildContext context, String texto, String ruta) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, ruta),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Text(texto, style: const TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
