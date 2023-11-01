import 'package:drift/drift.dart';
import 'package:wms/src/domain/entities/user.dart';
import 'package:wms/src/domain/repo/user_repo.dart';
import 'package:wms/src/infrastructure/db/database.dart';
import 'package:wms/src/infrastructure/db/models.dart';
import 'package:wms/src/infrastructure/mapper/user.dart';

part "user_repo.g.dart";

//TODO password hashing
@DriftAccessor(tables: [UserModel])
class DriftUserRepo extends DatabaseAccessor<AppDatabase>
    with _$DriftUserRepoMixin, UserRepo {
  DriftUserRepo(super.db);

  @override
  Future<User> createUser(User user) {
    return (into(userModel).insertReturning(user.toCompanion())).then((value) {
      return value.toEntity();
    });
  }

  @override
  Future<List<User>> getUser() {
    return select(userModel)
        .get()
        .then((value) => value.map((e) => e.toEntity()).toList());
  }

  @override
  Future<User?> login(String username, String password) {
    return (select(userModel)
          ..where((tbl) => tbl.userName.equals(username))
          ..where((tbl) => tbl.password.equals(password)))
        .getSingleOrNull()
        .then((value) => value?.toEntity());
  }

  @override
  Future<User> updateUser(User user) {
    return (update(userModel)..where((tbl) => tbl.id.equals(user.id)))
        .writeReturning(
            user.toCompanion().copyWith(updatedAt: Value(DateTime.now())))
        .then((value) => value.first.toEntity());
  }
}
