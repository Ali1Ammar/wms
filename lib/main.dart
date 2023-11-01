import 'package:flutter/widgets.dart';
import 'package:wms/src/core/app.dart';
import 'package:wms/src/core/utils/async_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

// ignore: missing_provider_scope
  runApp(MyApp(asyncConfig: await AsyncInit.init()));
}
