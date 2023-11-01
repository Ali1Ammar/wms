import 'package:flutter/material.dart';
import 'package:wms/src/core/utils/extensions/extensions.dart';

typedef ValidatorFunction = String? Function(String?);

class Validators {
  static ValidatorFunction merge(List<ValidatorFunction> list) {
    return (String? val) {
      for (final validator in list) {
        final error = validator(val);
        if (error != null) return error;
      }
      return null;
    };
  }

  static ValidatorFunction required(BuildContext context) {
    return (String? val) {
      if (val == null) return null;

      if (val.isEmpty) return context.translator.requiredField;
      return null;
    };
  }
}
