import 'package:flutter/material.dart';
import '../logica/ejercicio7_logica.dart';

class Ejercicio7Pantalla extends StatefulWidget {
  const Ejercicio7Pantalla({super.key});

  @override
  State<Ejercicio7Pantalla> createState() => _Ejercicio7PantallaState();
}

class _Ejercicio7PantallaState extends State<Ejercicio7Pantalla> {
  // Instanciamos la clase lógica correcta para el banco
  final BancoLogica _logica = BancoLogica();

  // Controladores para leer las cajas de texto del banco
  final TextEditingController _saldoAnteriorController = TextEditingController();
  final TextEditingController _comprasController = TextEditingController();
  final TextEditingController _pagoAnteriorController = TextEditingController();

  // Textos que mostraremos en la pantalla al calcular
  String _resultadoCliente = "Aquí aparecerán los datos del cliente.";
  String _gananciaBanco = "Ganancia total del banco: \$0.0";

  void _calcular() {
    double saldo = double.tryParse(_saldoAnteriorController.text) ?? 0.0;
    double compras = double.tryParse(_comprasController.text) ?? 0.0;
    double pago = double.tryParse(_pagoAnteriorController.text) ?? 0.0;

    // Llamamos a nuestro archivo lógico
    Map<String, double> resultados = _logica.procesarCliente(saldo, compras, pago);

    setState(() {
      _resultadoCliente = 
          "Saldo Actual: \$${resultados['saldoActual']?.toStringAsFixed(2)}\n\n"
          "Pago Mínimo (15%): \$${resultados['pagoMinimo']?.toStringAsFixed(2)}\n\n"
          "Pago para NO generar interés (85%): \$${resultados['pagoParaNoIntereses']?.toStringAsFixed(2)}\n\n"
          "Intereses/Multa de este cliente: \$${resultados['interesesYMulta']?.toStringAsFixed(2)}";
          
      _gananciaBanco = "Ganancia acumulada del banco: \$${resultados['gananciaTotalBanco']?.toStringAsFixed(2)}";
    });

    _saldoAnteriorController.clear();
    _comprasController.clear();
    _pagoAnteriorController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 7: Banco'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _saldoAnteriorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Saldo del corte anterior (\$)'),
            ),
            TextField(
              controller: _comprasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Monto de compras nuevas (\$)'),
            ),
            TextField(
              controller: _pagoAnteriorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Pago depositado (\$)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcular,
              child: const Text('Calcular Cliente'),
            ),
            const SizedBox(height: 20),
            Text(
              _resultadoCliente,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 40, thickness: 2),
            Text(
              _gananciaBanco,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
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