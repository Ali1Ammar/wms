import 'package:intl/intl.dart';
import 'package:wms/src/core/design/widget/form/money_field.dart';

extension DateTimeFormatter on DateTime {
  String format() {
    return DateFormat("dd/MM/yyyy").format(this);
  }
}

extension CurrencyFormatter on num {
  String format() {
    return MoneyField.moneyFormatter.format(toString());
  }
}
