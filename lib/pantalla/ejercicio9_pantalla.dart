import 'package:flutter/material.dart';
import '../logica/ejercicio9_logica.dart';

//Definir la clase principal
/*Pasos:
 1. Declarar la clase Ejercicio9Pantalla que extiende StatefulWidget.
*/
class Ejercicio9Pantalla extends StatefulWidget {
  const Ejercicio9Pantalla({super.key});

  @override
  State<Ejercicio9Pantalla> createState() => _Ejercicio9PantallaState();
}

// 2. Implementar
class _Ejercicio9PantallaState extends State<Ejercicio9Pantalla> {
  //LOGICA
  //mapeo de objetos
  final numeroCtrl = TextEditingController();
  //instancia de la clase logica
  final Ejercicio9Logica logica = Ejercicio9Logica();
  //variables
  String mensaje = 'Adivina un número del 1 al 100';
  String error = '';

  //calculos
  void probar() {
    final n = int.tryParse(numeroCtrl.text);
    setState(() {
      if (n == null || n < 1 || n > 100) {
        error = 'Ingrese un número del 1 al 100';
      } else {
        mensaje = logica.probar(n);
        error = '';
        numeroCtrl.clear();
      }
    });
  }

  void reiniciar() {
    numeroCtrl.clear();
    setState(() {
      logica.nuevoJuego();
      mensaje = 'Adivina un número del 1 al 100';
      error = '';
    });
  }

  //Diseño
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 9: Adivinar número'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //etiqueta
            Text(
              'Intentos restantes: ${logica.intentosRestantes}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            //campo de texto
            TextField(
              controller: numeroCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ingrese un número',
                border: OutlineInputBorder(),
              ),
              enabled: !logica.terminado,
            ),
            const SizedBox(height: 10),
            //botones
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: logica.terminado ? null : probar,
                  child: const Text('Probar'),
                ),
                ElevatedButton(
                  onPressed: reiniciar,
                  child: const Text('Nuevo juego'),
                ),
              ],
            ),
            Text(error, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 10),
            //resultado
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Volver al menú'),
            ),
          ],
        ),
      ),
    );
  }
}
