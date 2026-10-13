class Ejercicio10Logica {
  //variables
  int inferior = 0;
  int superior = 0;
  bool limitesListos = false;
  bool terminado = false;
  int suma = 0;
  int fuera = 0;
  bool igualLimite = false;
  List<int> numeros = [];

  //guardar los limites (si el inferior es mayor no se acepta)
  bool definirLimites(int inf, int sup) {
    if (inf > sup) {
      return false;
    }
    inferior = inf;
    superior = sup;
    limitesListos = true;
    return true;
  }

  //calculos
  void agregarNumero(int n) {
    //con el 0 se termina
    if (n == 0) {
      terminado = true;
      return;
    }

    numeros.add(n);

    if (n > inferior && n < superior) {
      //dentro del intervalo
      suma += n;
    } else if (n < inferior || n > superior) {
      //fuera del intervalo
      fuera++;
    } else {
      //igual a un limite
      igualLimite = true;
    }
  }

  void limpiar() {
    inferior = 0;
    superior = 0;
    limitesListos = false;
    terminado = false;
    suma = 0;
    fuera = 0;
    igualLimite = false;
    numeros.clear();
  }
}
