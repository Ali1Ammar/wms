import 'dart:developer';

import 'package:flutter/foundation.dart';

void logIt(Object? text) {
  log("\x1B[37m $text");
}

Future<void> recordError(dynamic exception, StackTrace? stack,
    {dynamic reason,
    Iterable<Object> information = const [],
    bool printDetails = true,
    bool fatal = false}) async {
  if (kDebugMode) {
    log("error", stackTrace: stack, error: exception);
  } else {
    logIt("""
ERROR: $exception
$stack""");
  }
  return;
}
