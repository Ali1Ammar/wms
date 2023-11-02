import 'package:auto_route/annotations.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:wms/src/core/design/widget/table/cell_label.dart';
import 'package:wms/src/core/design/widget/table/column_label.dart';
import 'package:wms/src/core/design/widget/table/table_header.dart';
import 'package:wms/src/core/utils/extensions/extensions.dart';
import 'package:wms/src/presentation/product/controller/product_controller.dart';
import 'package:wms/src/presentation/shared/navbar/async_handler.dart';

@RoutePage()
class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productControllerProvider);
    final screenSize = MediaQuery.of(context).size;
    final tr = context.translator;
    return Scaffold(
      body: AsyncHandlerWidget(
        asyncValue: productState,
        builder: (data) {
          return Column(
            children: [
              TableHeader(header: tr.product, action: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                IconButton(
                    onPressed: () {
                      ref.invalidate(productControllerProvider);
                    },
                    icon: const Icon(Icons.refresh)),
              ]),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: DataTable2(
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) =>
                              Theme.of(context).colorScheme.primaryContainer),
                      columns: [
                        DataColumn2(
                            label: ColumnLabel(title: tr.name),
                            fixedWidth: screenSize.width / 2,
                            size: ColumnSize.L),
                        DataColumn2(
                            label: ColumnLabel(title: tr.id),
                            size: ColumnSize.S),
                        DataColumn2(
                            label: ColumnLabel(title: tr.price),
                            size: ColumnSize.S),
                        DataColumn2(
                            label: ColumnLabel(title: tr.quantity),
                            size: ColumnSize.S),
                      ],
                      rows: data
                          .map((product) => DataRow2(cells: [
                                DataCell(CellLabel(title: product.name)),
                                DataCell(
                                  CellLabel(title: product.id.toString()),
                                ),
                                DataCell(CellLabel(
                                    title: product.basePrice.toString())),
                                DataCell(CellLabel(
                                    title: product.quantity.toString())),
                              ]))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
