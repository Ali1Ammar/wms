import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:wms/src/core/design/theme/space.dart';
import 'package:wms/src/core/design/widget/form/custom_field.dart';
import 'package:wms/src/core/design/widget/form/money_field.dart';
import 'package:wms/src/core/utils/extensions/context.dart';
import 'package:wms/src/core/utils/extensions/extensions.dart';

typedef AddProductResult = ({String name, String price, String quantity});

class AddProductDialog extends HookWidget {
  final ValueChanged<AddProductResult> onResult;
  const AddProductDialog({super.key, required this.onResult});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final priceController = useTextEditingController();
    final quantityController = useTextEditingController();
    final tr = context.translator;
    const gap = SizedBox(
      height: AppSpace.large,
    );
    return AlertDialog(
      title: Text(tr.addProduct),
      content: SizedBox(
        width: context.screenSize.width / 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: nameController,
              label: tr.name,
            ),
            gap,
            MoneyField(
              controller: priceController,
              label: tr.price,
            ),
            gap,
            CustomTextField(
              controller: quantityController,
              label: tr.quantity,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(tr.cancel),
        ),
        TextButton(
          onPressed: () {
            onResult((
              name: nameController.text,
              price: priceController.text,
              quantity: quantityController.text
            ));
            Navigator.of(context).pop();
          },
          child: Text(tr.add),
        ),
      ],
    );
  }
}
