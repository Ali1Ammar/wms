import 'package:wms/src/domain/entities/user.dart';
import 'package:wms/src/infrastructure/db/database.dart';

extension UserModelMapper on UserModelData {
  User toEntity() {
    return User(
      id: id,
      name: name,
      userName: userName,
      password: password,
      role: role,
    );
  }
}

extension UserModelCompanionMapper on User {
  UserModelCompanion toCompanion() {
    return UserModelCompanion.insert(
      name: name,
      userName: userName,
      password: password,
      role: role,
    );
  }
}
