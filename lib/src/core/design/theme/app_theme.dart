import 'package:flutter/material.dart';
import 'package:wms/src/core/design/theme/theme.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData.from(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: AppColor.primaryColor,
                primary: AppColor.primaryColor,
                brightness: Brightness.light))
        .sharedCopyWith();
  }

  static ThemeData darkTheme() {
    return ThemeData.from(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: AppColor.primaryColor,
                primary: AppColor.primaryColor,
                brightness: Brightness.dark))
        .sharedCopyWith();
  }
}

extension _ThemeDataHelper on ThemeData {
  ThemeData sharedCopyWith() {
    return copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        foregroundColor: colorScheme.onBackground,
        elevation: 2,
      ),
      inputDecorationTheme: inputDecoration(),
    );
  }

  InputDecorationTheme inputDecoration() {
    const outlined = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSpace.radius)));
    return InputDecorationTheme(
      border: outlined.copyWith(borderSide: BorderSide.none),
      enabledBorder: outlined.copyWith(borderSide: BorderSide.none),
      focusedBorder: outlined.copyWith(
          borderSide: const BorderSide(color: AppColor.primaryColor)),
      errorBorder: outlined,
      focusedErrorBorder: outlined,
    );
  }
}
