import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:wms/src/core/provider/repo.dart';
import 'package:wms/src/domain/entities/entities.dart';
import 'package:wms/src/presentation/transaction/state/filter_data.dart';

typedef TransactionControllerState = (List<Transaction> data, int totalCount);

final transactionControllerProvider =
    NotifierProvider<TransactionController, FilterData>(
        TransactionController.new);

class TransactionController extends Notifier<FilterData> {
  @override
  FilterData build() {
    return (productId: null, startDate: null, endDate: null);
  }

  Future<TransactionControllerState> getPaginated(int take, int skip) async {
    return ref
        .read(transactionRepoProvider)
        .getTransactions(skip: skip, take: take, productId: state.productId);
  }

  toggleProductId() {
    if (state.productId == null) {
      state = (startDate: null, endDate: null, productId: 2);
    } else {
      state = (startDate: null, endDate: null, productId: null);
    }
  }
}
