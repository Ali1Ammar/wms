import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final SharedPreferences _sharedPreferences;

  LocalStorageService({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;
}
