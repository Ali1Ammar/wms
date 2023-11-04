import 'dart:async';

import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:riverpod/riverpod.dart';
import 'package:wms/src/core/provider/repo.dart';
import 'package:wms/src/domain/entities/entities.dart';
import 'package:wms/src/presentation/transaction/page/add_transaction.dart';
import 'package:wms/src/presentation/transaction/state/filter_data.dart';

typedef TransactionControllerState = (List<Transaction> data, int totalCount);

final transactionControllerProvider =
    NotifierProvider<TransactionController, FilterData>(
        TransactionController.new);

class TransactionController extends Notifier<FilterData> {
  @override
  FilterData build() {
    return (
      product: null,
      dateRange: null,
    );
  }

  Future<TransactionControllerState> getPaginated(int take, int skip) async {
    return ref.read(transactionRepoProvider).getTransactions(
        skip: skip,
        take: take,
        productId: state.product?.id,
        startDate: state.dateRange?.start,
        endDate: state.dateRange?.end);
  }

  changeRange(DateRange? range) {
    state = (dateRange: range, product: state.product);
  }

  changeProduct(Product? product) {
    state = (dateRange: state.dateRange, product: product);
  }

  void addTransaction(AddTransactionResult res) {
    ref.read(transactionRepoProvider).createTransaction(Transaction(
        id: 0,
        product: res.product,
        price: int.parse(res.price.replaceAll(RegExp(r'[^0-9]'), "")),
        quantity: int.parse(res.quantity),
        date: DateTime.now()));
  }
}
