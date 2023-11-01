import 'package:wms/src/domain/entities/product.dart';
import 'package:wms/src/infrastructure/db/database.dart';

extension ProductModelMapper on ProductModelData {
  Product toEntity() {
    return Product(
      id: id,
      name: name,
      basePrice: basePrice,
      quantity: quantity,
    );
  }
}

extension ProductModelCompanionMapper on Product {
  ProductModelCompanion toCompanion() {
    return ProductModelCompanion.insert(
      name: name,
      basePrice: basePrice,
      quantity: quantity,
    );
  }
}
