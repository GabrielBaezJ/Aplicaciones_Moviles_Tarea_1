class MesAhorro {
  final int mes;
  final double deposito;
  final double acumulado;

  MesAhorro(this.mes, this.deposito, this.acumulado);
}

class Ejercicio8Logica {
  // Lista para guardar el historial de los 12 meses
  List<MesAhorro> ahorros = [];
  double totalAhorrado = 0.0;

  void agregarDeposito(double monto) {
    // Solo permitimos 12 meses (1 año)
    if (ahorros.length < 12) {
      totalAhorrado += monto;
      ahorros.add(MesAhorro(ahorros.length + 1, monto, totalAhorrado));
    }
  }

  void limpiar() {
    ahorros.clear();
    totalAhorrado = 0.0;
  }

  // Verifica si ya se llenaron los 12 meses
  bool get anioCompleto => ahorros.length == 12;
}