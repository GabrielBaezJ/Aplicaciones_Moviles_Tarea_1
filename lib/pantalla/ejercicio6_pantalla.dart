import 'package:flutter/material.dart';
import '../logica/ejercicio6_logica.dart';

class Ejercicio6Pantalla extends StatefulWidget {
  const Ejercicio6Pantalla({super.key});

  @override
  State<Ejercicio6Pantalla> createState() => _Ejercicio6PantallaState();
}

class _Ejercicio6PantallaState extends State<Ejercicio6Pantalla> {
  final valor = TextEditingController();
  int clave = 1;
  String mensaje = '';
  final Ejercicio6Logica logica = Ejercicio6Logica();

  void agregar() {
    final v = double.tryParse(valor.text);
    setState(() {
      if (v == null || v <= 0) {
        mensaje = 'Ingrese un valor válido';
      } else {
        logica.agregar(v, clave);
        valor.clear();
        mensaje = '';
      }
    });
  }

  void limpiar() {
    valor.clear();
    setState(() {
      logica.limpiar();
      mensaje = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 6: Impuesto vehículos'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: valor,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor del vehículo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton<int>(
              value: clave,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 1, child: Text('Clave 1 (10%)')),
                DropdownMenuItem(value: 2, child: Text('Clave 2 (7%)')),
                DropdownMenuItem(value: 3, child: Text('Clave 3 (5%)')),
              ],
              onChanged: (v) => setState(() => clave = v!),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(onPressed: agregar, child: const Text('Agregar')),
                ElevatedButton(onPressed: limpiar, child: const Text('Limpiar')),
              ],
            ),
            Text(mensaje, style: const TextStyle(color: Colors.red)),
            Expanded(
              child: ListView.builder(
                itemCount: logica.vehiculos.length,
                itemBuilder: (context, i) {
                  final v = logica.vehiculos[i];
                  return ListTile(
                    title: Text('Vehículo ${i + 1} - Clave ${v.clave}'),
                    subtitle: Text(
                        'Valor: \$${v.valor.toStringAsFixed(2)}  |  Impuesto: \$${v.impuesto.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            Text('Total clave 1: \$${logica.totalCategoria(1).toStringAsFixed(2)}'),
            Text('Total clave 2: \$${logica.totalCategoria(2).toStringAsFixed(2)}'),
            Text('Total clave 3: \$${logica.totalCategoria(3).toStringAsFixed(2)}'),
            Text(
              'Total general: \$${logica.totalGeneral.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
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