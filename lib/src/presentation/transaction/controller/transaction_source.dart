import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wms/src/core/design/widget/table/cell_label.dart';
import 'package:wms/src/core/utils/extensions/extensions.dart';

import 'package:wms/src/presentation/transaction/controller/transaction_controller.dart';

final transactionSourceProvider = Provider((ref) =>
    TransactionDataTable(ref.read(transactionControllerProvider.notifier)));

class TransactionDataTable extends AsyncDataTableSource {
  final TransactionController controller;
  TransactionDataTable(this.controller);

  @override
  Future<AsyncRowsResponse> getRows(int startIndex, int count) async {
    final items = await controller.getPaginated(count, startIndex);

    return AsyncRowsResponse(
        items.$2,
        items.$1.map((item) {
          return DataRow2(
            key: ValueKey<int>(item.id),
            cells: [
              DataCell(CellLabel(title: item.id.toString())),
              DataCell(
                CellLabel(title: item.product.name),
              ),
              DataCell(CellLabel(title: item.price.format())),
              DataCell(CellLabel(title: item.quantity.toString())),
              DataCell(CellLabel(title: item.date.format())),
            ],
          );
        }).toList());
  }
}
