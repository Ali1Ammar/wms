// These imports are necessary to open the sqlite3 database
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:wms/src/domain/entities/role.dart';
import 'package:wms/src/infrastructure/db/models.dart';
import 'package:wms/src/infrastructure/repo/product_repo.dart';

part 'database.g.dart';

@DriftDatabase(
    tables: [ProductModel, TransactionModel, UserModel],
    daos: [DriftProductRepo])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;
}

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
