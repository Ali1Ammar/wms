import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wms/src/core/utils/log/log.dart';

class RiverpodLogger extends ProviderObserver {
  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    recordError(error, stackTrace);
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (newValue is AsyncError) {
      recordError(newValue.error, newValue.stackTrace);
    }
  }
}
