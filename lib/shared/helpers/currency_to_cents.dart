int currencyToCents(double valor) {
  // Multiplica o valor por 100 e converte para inteiro
  int centavos = (valor * 100).round();
  return centavos;
}
