import 'package:auto_route/annotations.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wms/src/core/design/widget/custom_date_picker.dart';
import 'package:wms/src/core/design/widget/table/column_label.dart';
import 'package:wms/src/core/utils/extensions/extensions.dart';
import 'package:wms/src/presentation/transaction/controller/transaction_source.dart';
import 'package:wms/src/presentation/transaction/controller/transaction_controller.dart';
import 'package:wms/src/presentation/transaction/widget/product_selector.dart';

@RoutePage()
class TransactionPage extends HookConsumerWidget {
  const TransactionPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paginatorController = useMemoized(() => PaginatorController());
    final productState = ref.watch(transactionControllerProvider);
    final source = ref.watch(transactionSourceProvider);
    final screenSize = MediaQuery.of(context).size;
    final tr = context.translator;
    return Scaffold(
        body: AsyncPaginatedDataTable2(
      controller: paginatorController,
      header: Text(tr.transaction),
      onRowsPerPageChanged: (x) {},
      wrapInCard: true,
      empty: const Text("no data"),
      showFirstLastButtons: true,
      actions: [
        ProductSelector(
            selectedProduct: productState.product,
            onChanged: (val) {
              ref
                  .read(transactionControllerProvider.notifier)
                  .changeProduct(val);
              paginatorController.goToFirstPage();
            }),
        CustomRangeDatePicker(
          selected: productState.dateRange,
          onResult: (val) {
            ref.read(transactionControllerProvider.notifier).changeRange(val);
            paginatorController.goToFirstPage();
          },
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        IconButton(
            onPressed: () {
              ref.invalidate(transactionControllerProvider);
            },
            icon: const Icon(Icons.refresh)),
      ],
      rowsPerPage: 10,
      source: source,
      headingRowColor: MaterialStateColor.resolveWith(
          (states) => Theme.of(context).colorScheme.primaryContainer),
      columns: [
        DataColumn2(label: ColumnLabel(title: tr.id), size: ColumnSize.S),
        DataColumn2(
            label: ColumnLabel(title: tr.name),
            fixedWidth: screenSize.width / 3,
            size: ColumnSize.L),
        DataColumn2(label: ColumnLabel(title: tr.price), size: ColumnSize.S),
        DataColumn2(label: ColumnLabel(title: tr.quantity), size: ColumnSize.S),
        DataColumn2(label: ColumnLabel(title: tr.date), size: ColumnSize.S),
      ],
    ));
  }
}
