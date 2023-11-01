import 'package:wms/src/domain/entities/product.dart';
import 'package:wms/src/domain/entities/transaction.dart';
import 'package:wms/src/infrastructure/db/database.dart';

extension TransactionModelMapper on TransactionModelData {
  Transaction toEntity(Product product) {
    return Transaction(
      id: id,
      quantity: quantity,
      price: price,
      date: createdAt,
      product: product,
    );
  }
}

extension TransactionModelCompanionMapper on Transaction {
  TransactionModelCompanion toCompanion() {
    return TransactionModelCompanion.insert(
      quantity: quantity,
      price: price,
      productId: product.id,
    );
  }
}
