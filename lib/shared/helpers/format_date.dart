import 'package:intl/intl.dart';

sealed class FormatDate {
  static String ddMMYYYY(String strDate) {
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(strDate));
  }

  static String ddMMYYYYHm(String strDate) {
    final ddMmYyyy = ddMMYYYY(strDate);
    final hm = DateFormat.Hm().format(DateTime.parse(strDate));

    return "$ddMmYyyy às $hm";
  }
}
