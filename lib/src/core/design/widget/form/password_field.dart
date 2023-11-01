import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:wms/gen/assets.gen.dart';
import 'package:wms/src/core/design/widget/widget.dart';
import 'package:wms/src/core/utils/extensions/localization.dart';
import 'package:wms/src/core/utils/validator/validator.dart';

class PasswordField extends HookWidget {
  final bool isLoading;
  final TextEditingController controller;
  final String? hint;
  final FormFieldValidator<String>? validator;

  const PasswordField(
      {super.key,
      required this.isLoading,
      required this.controller,
      this.hint,
      this.validator});
  @override
  Widget build(BuildContext context) {
    final obscureText = useState(true);
    useListenable(controller);

    return CustomTextField(
      hint: hint ?? context.translator.enterPassword,
      validator: Validators.merge(
          [Validators.required(context), if (validator != null) validator!]),
      controller: controller,
      keyboardType: TextInputType.text,
      icon: controller.text.isNotEmpty
          ? IconButton(
              onPressed: () {
                obscureText.value = !obscureText.value;
              },
              icon: obscureText.value
                  ? Assets.images.svg.eye.svg(width: 20)
                  : Assets.images.svg.eyeOff.svg(width: 20),
            )
          : null,
      textDirection: TextDirection.ltr,
      obscureText: obscureText.value,
      enabled: !isLoading,
    );
  }
}
