import 'package:drift/drift.dart';
import 'package:wms/src/domain/entities/transaction.dart';
import 'package:wms/src/domain/repo/transaction_repo.dart';
import 'package:wms/src/infrastructure/db/database.dart';
import 'package:wms/src/infrastructure/db/models.dart';
import 'package:wms/src/infrastructure/mapper/product.dart';
import 'package:wms/src/infrastructure/mapper/transaction.dart';

part "transaction_repo.g.dart";

@DriftAccessor(tables: [TransactionModel])
class DriftTransactionRepo extends DatabaseAccessor<AppDatabase>
    with _$DriftTransactionRepoMixin, TransactionRepo {
  DriftTransactionRepo(super.db);

  @override
  Future<Transaction> createTransaction(Transaction transaction) async {
    return (await into(transactionModel)
            .insertReturning(transaction.toCompanion()))
        .toEntity(transaction.product);
  }

  @override
  Future<List<Transaction>> getTransactions(
      {DateTime? startDate,
      DateTime? endDate,
      int? productId,
      required int skip,
      required int take}) {
    var query = select(transactionModel).join([
      leftOuterJoin(
          productModel, productModel.id.equalsExp(transactionModel.productId))
    ]);
    if (startDate != null) {
      query = query
        ..where(transactionModel.createdAt.isBiggerOrEqualValue(startDate));
    }
    if (endDate != null) {
      query = query
        ..where(transactionModel.createdAt.isSmallerOrEqualValue(endDate));
    }
    if (productId != null) {
      query = query..where(transactionModel.productId.equals(productId));
    }

    query.limit(take, offset: skip);

    return query.get().then((value) {
      return value
          .map((e) => e
              .readTable(transactionModel)
              .toEntity(e.readTable(productModel).toEntity()))
          .toList();
    });
  }
}
