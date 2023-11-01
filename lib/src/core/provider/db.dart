import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wms/src/core/utils/async_init.dart';
import 'package:wms/src/infrastructure/db/database.dart';

final appDbProvider =
    Provider((ref) => AppDatabase(ref.read(asyncInitProvider).queryExecutor));
