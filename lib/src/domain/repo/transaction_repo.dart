import 'package:wms/src/domain/entities/transaction.dart';

abstract mixin class TransactionRepo {
  Future<List<Transaction>> getTransactions(
      {DateTime? startDate,
      DateTime? endDate,
      int? productId,
      required int skip,
      required int take});
  Future<Transaction> createTransaction(Transaction transaction);
}
