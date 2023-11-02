import 'package:auto_route/annotations.dart';
import 'package:capped_progress_indicator/capped_progress_indicator.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:wms/src/core/design/widget/table/cell_label.dart';
import 'package:wms/src/core/design/widget/table/column_label.dart';
import 'package:wms/src/core/design/widget/table/table_header.dart';
import 'package:wms/src/core/utils/extensions/extensions.dart';
import 'package:wms/src/presentation/shared/navbar/async_handler.dart';
import 'package:wms/src/presentation/transaction/controller/transaction_controller.dart';

@RoutePage()
class TransactionPage extends ConsumerWidget {
  const TransactionPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(transactionControllerProvider);
    final screenSize = MediaQuery.of(context).size;
    final tr = context.translator;
    return Scaffold(
      body: AsyncHandlerWidget(
        asyncValue: productState,
        builder: (data) {
          return Column(
            children: [
              TableHeader(header: tr.transaction, action: [
                if (productState.isLoading)
                  const CircularCappedProgressIndicator(
                    strokeCap: StrokeCap.round,
                  ),
                IconButton(
                    onPressed: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (context) => AddProductDialog(
                      //           onResult: (res) {
                      //             ref
                      //                 .read(productControllerProvider.notifier)
                      //                 .addProduct(res);
                      //           },
                      //         ));
                    },
                    icon: const Icon(Icons.add)),
                IconButton(
                    onPressed: () {
                      ref.invalidate(transactionControllerProvider);
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
                            label: ColumnLabel(title: tr.id),
                            size: ColumnSize.S),
                        DataColumn2(
                            label: ColumnLabel(title: tr.name),
                            fixedWidth: screenSize.width / 3,
                            size: ColumnSize.L),
                        DataColumn2(
                            label: ColumnLabel(title: tr.price),
                            size: ColumnSize.S),
                        DataColumn2(
                            label: ColumnLabel(title: tr.quantity),
                            size: ColumnSize.S),
                        DataColumn2(
                            label: ColumnLabel(title: tr.date),
                            size: ColumnSize.S),
                      ],
                      rows: data
                          .map((item) => DataRow2(cells: [
                                DataCell(CellLabel(title: item.id.toString())),
                                DataCell(
                                  CellLabel(title: item.product.name),
                                ),
                                DataCell(CellLabel(title: item.price.format())),
                                DataCell(
                                    CellLabel(title: item.quantity.toString())),
                                DataCell(CellLabel(title: item.date.format())),
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
