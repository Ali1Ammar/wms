extension DateTimeJumper on DateTime {
  DateTime startOfMonth() {
    return copyWith(day: 1);
  }

  DateTime endOfMonth() {
    return copyWith(month: month + 1)
        .startOfMonth()
        .subtract(const Duration(days: 1));
  }
}
