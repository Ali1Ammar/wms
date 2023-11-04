import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:wms/src/core/design/theme/space.dart';
import 'package:wms/src/core/design/widget/form/custom_field.dart';
import 'package:wms/src/core/design/widget/form/money_field.dart';
import 'package:wms/src/core/utils/extensions/extensions.dart';
import 'package:wms/src/domain/entities/entities.dart';
import 'package:wms/src/presentation/transaction/widget/product_selector.dart';

typedef AddTransactionResult = ({
  Product product,
  String price,
  String quantity
});

class AddTransactionDialog extends HookWidget {
  final ValueChanged<AddTransactionResult> onResult;
  const AddTransactionDialog({super.key, required this.onResult});

  @override
  Widget build(BuildContext context) {
    final productSelector = useState<Product?>(null);
    final priceController = useTextEditingController();
    final quantityController = useTextEditingController();
    final tr = context.translator;
    const gap = SizedBox(
      height: AppSpace.large,
    );
    return AlertDialog(
      title: Text(tr.addTransaction),
      content: SizedBox(
        width: context.screenSize.width / 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProductSelector.fromValueNotifier(
              productSelector,
              isExpanded: true,
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
              product: productSelector.value!,
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
