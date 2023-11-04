import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wms/src/core/design/animation/animated_hide.dart';
import 'package:wms/src/core/design/theme/space.dart';
import 'package:wms/src/domain/entities/product.dart';
import 'package:wms/src/presentation/product/controller/product_controller.dart';

class ProductSelector extends HookConsumerWidget {
  final Product? selectedProduct;
  final ValueChanged<Product?> onChanged;

  const ProductSelector(
      {super.key, required this.selectedProduct, required this.onChanged});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productControllerProvider);
    return AnimatedHide(
      show: products.hasValue,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<Product>(
          value: selectedProduct,
          buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.all(0),
            elevation: 0,
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.background),
                borderRadius: BorderRadius.circular(AppSpace.radius * 2)),
          ),
          hint: const Text("select product"),
          onChanged: (val) {
            if (val == selectedProduct) {
              onChanged(null);
            } else {
              onChanged(val);
            }
          },
          items: (products.valueOrNull ?? [])
              .map((e) => DropdownItem<Product>(
                    value: e,
                    child: Text(e.name),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
