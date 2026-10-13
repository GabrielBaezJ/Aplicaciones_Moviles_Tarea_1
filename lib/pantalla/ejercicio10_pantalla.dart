import 'package:flutter/material.dart';
import '../logica/ejercicio10_logica.dart';

//Definir la clase principal
/*Pasos:
 1. Declarar la clase Ejercicio10Pantalla que extiende StatefulWidget.
*/
class Ejercicio10Pantalla extends StatefulWidget {
  const Ejercicio10Pantalla({super.key});

  @override
  State<Ejercicio10Pantalla> createState() => _Ejercicio10PantallaState();
}

// 2. Implementar
class _Ejercicio10PantallaState extends State<Ejercicio10Pantalla> {
  //LOGICA
  //mapeo de objetos
  final inferiorCtrl = TextEditingController();
  final superiorCtrl = TextEditingController();
  final numeroCtrl = TextEditingController();
  //instancia de la clase logica
  final Ejercicio10Logica logica = Ejercicio10Logica();
  //variables
  String mensaje = '';

  //guardar limites
  void guardarLimites() {
    final inf = int.tryParse(inferiorCtrl.text);
    final sup = int.tryParse(superiorCtrl.text);
    setState(() {
      if (inf == null || sup == null) {
        mensaje = 'Ingrese los dos límites';
      } else if (!logica.definirLimites(inf, sup)) {
        //volver a pedir
        mensaje = 'El límite inferior no puede ser mayor que el superior';
        inferiorCtrl.clear();
        superiorCtrl.clear();
      } else {
        mensaje = '';
      }
    });
  }

  //calculos
  void agregar() {
    final n = int.tryParse(numeroCtrl.text);
    setState(() {
      if (n == null) {
        mensaje = 'Ingrese un número válido';
      } else {
        logica.agregarNumero(n);
        numeroCtrl.clear();
        mensaje = '';
      }
    });
  }

  void limpiar() {
    inferiorCtrl.clear();
    superiorCtrl.clear();
    numeroCtrl.clear();
    setState(() {
      logica.limpiar();
      mensaje = '';
    });
  }

  //Diseño
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 10: Intervalo'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            //campos de los limites
            TextField(
              controller: inferiorCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Límite inferior',
                border: OutlineInputBorder(),
              ),
              enabled: !logica.limitesListos,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: superiorCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Límite superior',
                border: OutlineInputBorder(),
              ),
              enabled: !logica.limitesListos,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: logica.limitesListos ? null : guardarLimites,
              child: const Text('Guardar límites'),
            ),
            const SizedBox(height: 10),
            //campo de los numeros
            TextField(
              controller: numeroCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ingrese un número (0 para terminar)',
                border: OutlineInputBorder(),
              ),
              enabled: logica.limitesListos && !logica.terminado,
            ),
            const SizedBox(height: 10),
            //botones
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: logica.limitesListos && !logica.terminado ? agregar : null,
                  child: const Text('Agregar'),
                ),
                ElevatedButton(onPressed: limpiar, child: const Text('Limpiar')),
              ],
            ),
            Text(mensaje, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 10),
            //numeros ingresados
            Text('Números ingresados: ${logica.numeros.join(', ')}'),
            const Divider(thickness: 2),
            //resultado (solo cuando se ingresa el 0)
            if (logica.terminado) ...[
              Text('Intervalo: (${logica.inferior}, ${logica.superior})'),
              Text('Suma dentro del intervalo: ${logica.suma}'),
              Text('Números fuera del intervalo: ${logica.fuera}'),
              Text(
                logica.igualLimite
                    ? 'Sí se ingresó un número igual a los límites'
                    : 'No se ingresó ningún número igual a los límites',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ],
            const SizedBox(height: 10),
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
