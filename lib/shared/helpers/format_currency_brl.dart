import 'package:intl/intl.dart';

String formatCurrencyBrl(double value) {
  NumberFormat formatCurrency = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return formatCurrency.format(value);
}
