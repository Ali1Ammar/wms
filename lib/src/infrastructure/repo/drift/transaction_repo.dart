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
  Future<(List<Transaction>, int)> getTransactions(
      {DateTime? startDate,
      DateTime? endDate,
      int? productId,
      required int skip,
      required int take}) async {
    void addWhere(JoinedSelectStatement query) {
      if (startDate != null) {
        query.where(transactionModel.createdAt.isBiggerOrEqualValue(startDate));
      }
      if (endDate != null) {
        query.where(transactionModel.createdAt.isSmallerOrEqualValue(endDate));
      }
      if (productId != null) {
        query.where(transactionModel.productId.equals(productId));
      }
    }

    final totalCountField = transactionModel.id.count();
    final countQuery = selectOnly(transactionModel)
      ..addColumns([totalCountField]);
    addWhere(countQuery);

    var query = select(transactionModel).join([
      leftOuterJoin(
          productModel, productModel.id.equalsExp(transactionModel.productId))
    ]);
    addWhere(query);
    query.limit(take, offset: skip);

    final data = await query.get().then((value) {
      return value
          .map((e) => e
              .readTable(transactionModel)
              .toEntity(e.readTable(productModel).toEntity()))
          .toList();
    });
    final totalCount = await countQuery
        .getSingle()
        .then((value) => value.read(totalCountField));

    return (data, totalCount!);
  }
}
