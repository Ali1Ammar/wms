import 'package:drift/drift.dart';
import 'package:wms/src/domain/entities/product.dart';
import 'package:wms/src/domain/repo/product_repo.dart';
import 'package:wms/src/infrastructure/db/database.dart';
import 'package:wms/src/infrastructure/db/models.dart';
import 'package:wms/src/infrastructure/mapper/product.dart';

part "product_repo.g.dart";

@DriftAccessor(tables: [ProductModel])
class DriftProductRepo extends DatabaseAccessor<AppDatabase>
    with _$DriftProductRepoMixin, ProductRepo {
  DriftProductRepo(super.db);

  @override
  Future<Product> createProduct(Product product) async {
    return (await into(productModel).insertReturning(product.toCompanion()))
        .toEntity();
  }

  @override
  Future<List<Product>> getProducts() {
    return select(productModel)
        .get()
        .then((value) => value.map((e) => e.toEntity()).toList());
  }

  @override
  Future<Product> updateProduct(Product product) async {
    return (await (update(productModel)
              ..where((tbl) => tbl.id.equals(product.id)))
            .writeReturning(product
                .toCompanion()
                .copyWith(updatedAt: Value(DateTime.now()))))
        .first
        .toEntity();
  }
}
