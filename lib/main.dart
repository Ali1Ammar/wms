import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wms/src/core/app.dart';
import 'package:wms/src/core/utils/async_init.dart';
import 'package:wms/src/core/utils/log/riverpod_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final providerContainer = ProviderContainer();
  final asyncInit = await AsyncInit.init(providerContainer);
  runApp(ProviderScope(
      parent: providerContainer,
      overrides: [
        asyncInitProvider.overrideWithValue(asyncInit),
      ],
      observers: [RiverpodLogger()],
      child: const MyApp()));
}
