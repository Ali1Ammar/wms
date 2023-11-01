import 'package:wms/src/domain/entities/product.dart';

abstract mixin class ProductRepo {
  Future<List<Product>> getProducts();
  Future<Product> createProduct(Product product);
  Future<Product> updateProduct(Product product);
}
