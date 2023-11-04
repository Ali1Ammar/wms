import 'package:flutter/material.dart';

extension ValueNotifierExtension<T> on ValueNotifier<T> {
  void Function(T value) setterMethod() {
    return (T v) => value = v;
  }
}
