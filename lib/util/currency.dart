import 'package:intl/intl.dart';

class Currency {
  static String formatCurrency({required double amount}) {
    return NumberFormat.simpleCurrency().format(amount);
  }
}
