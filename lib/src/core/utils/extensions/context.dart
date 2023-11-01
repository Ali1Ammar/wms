import 'package:flutter/widgets.dart';

extension ContextHelper on BuildContext {
  bool isTablet() {
    return MediaQuery.of(this).size.width > 600;
  }
}
