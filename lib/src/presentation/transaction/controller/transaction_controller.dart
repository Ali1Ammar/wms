import 'dart:async';

import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
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
    return (
      productId: null,
      dateRange: null,
    );
  }

  Future<TransactionControllerState> getPaginated(int take, int skip) async {
    return ref.read(transactionRepoProvider).getTransactions(
        skip: skip,
        take: take,
        productId: state.productId,
        startDate: state.dateRange?.start,
        endDate: state.dateRange?.end);
  }

  changeRange(DateRange? range) {
    state = (dateRange: range, productId: state.productId);
  }
}
