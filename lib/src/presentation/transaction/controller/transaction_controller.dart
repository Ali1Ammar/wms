import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:wms/src/core/provider/repo.dart';
import 'package:wms/src/domain/entities/entities.dart';

typedef TransactionControllerState = List<Transaction>;

final transactionControllerProvider =
    AsyncNotifierProvider<TransactionController, TransactionControllerState>(
        TransactionController.new);

class TransactionController extends AsyncNotifier<TransactionControllerState> {
  @override
  FutureOr<TransactionControllerState> build() {
    return ref.read(transactionRepoProvider).getTransactions(skip: 0, take: 50);
  }
}
