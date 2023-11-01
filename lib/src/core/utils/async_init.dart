import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final asyncInitProvider =
    Provider<AsyncInit>((ref) => throw UnimplementedError());

// we use this to await(at main.dart) any global needed config value like path provider, device into, package info and other and then provide this value to the app using provider override
class AsyncInit {
  late final SharedPreferences sharedPreferences;

  AsyncInit._();
  static Future<AsyncInit> init() async {
    final object = AsyncInit._();

    await Future.wait([
      SharedPreferences.getInstance().then((value) {
        object.sharedPreferences = value;
      }),
    ]);
    return object;
  }
}
