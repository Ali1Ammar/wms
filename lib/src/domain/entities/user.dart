import 'package:wms/src/domain/entities/role.dart';

class User {
  final int id;
  final String name;
  final String userName;
  final String password;
  final Role role;

  User(
      {required this.id,
      required this.name,
      required this.userName,
      required this.password,
      required this.role});
}
