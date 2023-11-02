import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import 'package:wms/src/core/design/widget/form/custom_field.dart';
import 'package:wms/src/core/utils/extensions/extensions.dart';
import 'package:wms/src/core/utils/validator/validator.dart';

class MoneyField extends StatelessWidget {
  static final moneyFormatter = CurrencyTextInputFormatter(
    locale: "ar_IQ",
    symbol: "",
    enableNegative: false,
    decimalDigits: 0,
  );
  final String? hint;
  final String? label;
  final Color? fillColor;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  const MoneyField({
    super.key,
    this.hint,
    required this.controller,
    this.label,
    this.fillColor,
    this.enabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      enabled: enabled,
      leading: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          context.translator.currency,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      validator: Validators.required(context),
      keyboardType: TextInputType.number,
      inputFormatters: [moneyFormatter],
      hint: hint,
      fillColor: fillColor,
      label: label,
      controller: controller,
      onChanged: onChanged,
    );
  }
}
