class Vehiculo {
  double valor;
  int clave;
  double impuesto;

  Vehiculo(this.valor, this.clave, this.impuesto);
}

class Ejercicio6Logica {
  List<Vehiculo> vehiculos = [];

  double porcentaje(int clave) {
    if (clave == 1) return 0.10;
    if (clave == 2) return 0.07;
    return 0.05;
  }

  void agregar(double valor, int clave) {
    double impuesto = valor * porcentaje(clave);
    vehiculos.add(Vehiculo(valor, clave, impuesto));
  }

  double totalCategoria(int clave) {
    double total = 0;
    for (final v in vehiculos) {
      if (v.clave == clave) total += v.impuesto;
    }
    return total;
  }

  double get totalGeneral {
    double total = 0;
    for (final v in vehiculos) {
      total += v.impuesto;
    }
    return total;
  }

  void limpiar() {
    vehiculos.clear();
  }
}