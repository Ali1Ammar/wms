import 'package:wms/src/domain/entities/user.dart';

abstract class UserRepo {
  Future<List<User>> getUser();
  Future<User> createUser(User user);
  Future<User> updateUser(User user);
  Future<User?> login(String username, String password);
}
