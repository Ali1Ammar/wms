import 'package:drift/drift.dart';
import 'package:wms/src/domain/entities/role.dart';

class ProductModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get basePrice => integer().nullable()();
  IntColumn get stock => integer().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class TransactionModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer()();
  IntColumn get quantity => integer()();
  IntColumn get price => integer()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class UserModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get userName => text()();
  TextColumn get password => text()();
  TextColumn get role => textEnum<Role>()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}
