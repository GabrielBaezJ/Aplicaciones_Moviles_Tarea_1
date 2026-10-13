import 'dart:math';

class Ejercicio9Logica {
  //variables
  int numeroSecreto = 0;
  int intentos = 0;
  int maxIntentos = 10;
  bool terminado = false;

  Ejercicio9Logica() {
    nuevoJuego();
  }

  //generar un numero del 1 al 100
  void nuevoJuego() {
    numeroSecreto = Random().nextInt(100) + 1;
    intentos = 0;
    terminado = false;
  }

  //intentos que quedan
  int get intentosRestantes => maxIntentos - intentos;

  //calculos
  String probar(int numero) {
    intentos++;

    //si acierta
    if (numero == numeroSecreto) {
      terminado = true;
      return '¡Correcto! Adivinaste el número en $intentos intentos';
    }

    //si se acaban los intentos
    if (intentos >= maxIntentos) {
      terminado = true;
      return 'Se acabaron los intentos. El número era $numeroSecreto';
    }

    //decir si es mayor o menor
    if (numeroSecreto > numero) {
      return 'El número es MAYOR que $numero. Te quedan $intentosRestantes intentos';
    } else {
      return 'El número es MENOR que $numero. Te quedan $intentosRestantes intentos';
    }
  }
}
