String? nullableStringFromEnvironment(String key) {
  final value = String.fromEnvironment(key, defaultValue: "");
  return value.isEmpty ? null : value;
}
