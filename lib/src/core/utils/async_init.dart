import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wms/seed/seed.dart';
import 'package:wms/src/core/provider/provider.dart';
import 'package:wms/src/infrastructure/db/database.dart';

final asyncInitProvider =
    Provider<AsyncInit>((ref) => throw UnimplementedError());

// we use this to await(at main.dart) any global needed config value like path provider, device into, package info and other and then provide this value to the app using provider override
class AsyncInit {
  late final SharedPreferences sharedPreferences;
  late final QueryExecutor queryExecutor;

  AsyncInit._();
  static Future<AsyncInit> init(ProviderContainer ref) async {
    final object = AsyncInit._();
    if (ref.read(envConfig).reSetDb) {
      await deleteAll();
    }
    await Future.wait([
      SharedPreferences.getInstance().then((value) {
        object.sharedPreferences = value;
      }),
      openDbInBackground().then((value) {
        object.queryExecutor = value;
      })
    ]);

    if (ref.read(envConfig).reSetDb) {
      await seed(AppDatabase(object.queryExecutor));
    }
    return object;
  }
}
