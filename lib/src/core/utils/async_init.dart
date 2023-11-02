import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wms/seed/seed.dart';
import 'package:wms/src/core/provider/db.dart';
import 'package:wms/src/core/provider/provider.dart';
import 'package:wms/src/infrastructure/db/database.dart';

final asyncInitProvider = Provider<AsyncInit>((ref) => AsyncInit(ref: ref));

// we use this to await(at main.dart) any global needed config value like path provider, device into, package info and other and then provide this value to the app using provider override
class AsyncInit {
  final Ref ref;
  late final SharedPreferences sharedPreferences;
  late final QueryExecutor queryExecutor;

  AsyncInit({required this.ref});

  Future<void> init() async {
    final env = ref.read(envConfig);
    if (env.reSetDb) {
      await deleteAll();
    }
    await Future.wait([
      SharedPreferences.getInstance().then((value) {
        sharedPreferences = value;
      }),
      openDbInBackground().then((value) {
        queryExecutor = value;
      })
    ]);

    if (env.reSetDb) {
      await seed(ref.read(appDbProvider));
    }
  }

  complete() {}
}
