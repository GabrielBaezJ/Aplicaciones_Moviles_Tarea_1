import 'package:flutter/material.dart';
import '../logica/ejercicio8_logica.dart';

class Ejercicio8Pantalla extends StatefulWidget {
  const Ejercicio8Pantalla({super.key});

  @override
  State<Ejercicio8Pantalla> createState() => _Ejercicio8PantallaState();
}

class _Ejercicio8PantallaState extends State<Ejercicio8Pantalla> {
  final Ejercicio8Logica _logica = Ejercicio8Logica();
  final TextEditingController _montoController = TextEditingController();
  String _mensaje = '';

  void _depositar() {
    if (_logica.anioCompleto) {
      setState(() {
        _mensaje = 'El año (12 meses) ya está completo. Presione Limpiar para reiniciar.';
      });
      return;
    }

    double monto = double.tryParse(_montoController.text) ?? 0.0;

    setState(() {
      if (monto <= 0) {
        _mensaje = 'Ingrese una cantidad válida mayor a 0';
      } else {
        _logica.agregarDeposito(monto);
        _montoController.clear();
        _mensaje = '';
      }
    });
  }

  void _limpiar() {
    _montoController.clear();
    setState(() {
      _logica.limpiar();
      _mensaje = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 8: Ahorro Anual'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Mes actual: ${_logica.anioCompleto ? "Completado" : _logica.ahorros.length + 1}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _montoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Depósito de este mes (\$)',
                border: OutlineInputBorder(),
              ),
              enabled: !_logica.anioCompleto,
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: _logica.anioCompleto ? null : _depositar, 
                  child: const Text('Depositar')
                ),
                ElevatedButton(
                  onPressed: _limpiar, 
                  child: const Text('Limpiar Todo')
                ),
              ],
            ),
            Text(_mensaje, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 10),
            const Divider(thickness: 2),
            Expanded(
              child: ListView.builder(
                itemCount: _logica.ahorros.length,
                itemBuilder: (context, i) {
                  final item = _logica.ahorros[i];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${item.mes}')),
                    title: Text('Depósito: \$${item.deposito.toStringAsFixed(2)}'),
                    subtitle: Text(
                      'Acumulado: \$${item.acumulado.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
            const Divider(thickness: 2),
            Text(
              'Ahorro Total Anual: \$${_logica.totalAhorrado.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.blue),
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