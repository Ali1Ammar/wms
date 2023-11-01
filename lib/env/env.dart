import 'package:flutter/foundation.dart';

class Env {
  final bool reSetDb = !kReleaseMode && const bool.fromEnvironment('reSetDb');
  Env();
}
