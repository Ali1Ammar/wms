import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wms/src/core/app.dart';
import 'package:wms/src/core/utils/async_init.dart';
import 'package:wms/src/core/utils/log/riverpod_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final providerContainer = ProviderContainer();
  await providerContainer.read(asyncInitProvider).init();
  runApp(ProviderScope(
      parent: providerContainer,
      observers: [RiverpodLogger()],
      child: const MyApp()));
}
