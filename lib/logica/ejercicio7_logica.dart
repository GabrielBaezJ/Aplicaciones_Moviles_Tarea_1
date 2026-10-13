class BancoLogica {
  
  double totalGananciaBanco = 0.0;

  Map<String, double> procesarCliente(double saldoAnterior, double compras, double pagoAnterior) {
    // 1. Calculamos el saldo antes de multas
    double saldoActual = saldoAnterior + compras - pagoAnterior;
    
    double intereses = 0.0;
    double multa = 0.0;

    
    //  15% de su saldo anterior (su pago mínimo del corte pasado).
    double pagoMinimoAnterior = saldoAnterior * 0.15;
    
    // Si pagó menos de ese mínimo, es moroso y se le aplican recargos
    if (pagoAnterior < pagoMinimoAnterior) {
      intereses = saldoActual * 0.12; 
      multa = 200.0;                  
    }

    // 2. Saldo actual sumando los intereses y la multa
    saldoActual = saldoActual + intereses + multa;
    
    // 3. Ganancia extra al total global del banco
    totalGananciaBanco += (intereses + multa);

    // 4. Calcular sus nuevos pagos para el próximo corte
    double pagoMinimo = saldoActual * 0.15;
    double pagoParaNoIntereses = saldoActual * 0.85;

    
    return {
      'saldoActual': saldoActual,
      'pagoMinimo': pagoMinimo,
      'pagoParaNoIntereses': pagoParaNoIntereses,
      'interesesYMulta': intereses + multa,
      'gananciaTotalBanco': totalGananciaBanco,
    };
  }
}