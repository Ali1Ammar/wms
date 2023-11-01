import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  // ignore: unused_field
  final SharedPreferences _sharedPreferences;

  LocalStorageService({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;
}
