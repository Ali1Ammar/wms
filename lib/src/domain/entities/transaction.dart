import 'package:wms/src/domain/entities/product.dart';

class Transaction {
  final int id;
  final int quantity;
  final int price;
  final DateTime date;
  final Product product;
  Transaction(
      {required this.id,
      required this.quantity,
      required this.price,
      required this.date,
      required this.product});
}
