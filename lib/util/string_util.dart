String approximateNumberFormat(double number) {
  if (number % 1 == 0) return number.toStringAsFixed(0);
  return "${number.floor()}-${number.ceil()}";
}
