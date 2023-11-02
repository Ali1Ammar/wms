import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:wms/src/core/provider/repo.dart';
import 'package:wms/src/domain/entities/entities.dart';
import 'package:wms/src/presentation/product/page/add_product.dart';

final productControllerProvider =
    AsyncNotifierProvider<ProductController, List<Product>>(
        ProductController.new);

class ProductController extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() async {
    final res = await ref.read(productRepoProvider).getProducts();
    return res;
  }

  Future<void> addProduct(AddProductResult data) async {
    state = const AsyncLoading<List<Product>>().copyWithPrevious(state);
    final newProduct = await ref.read(productRepoProvider).createProduct(
        Product(
            name: data.name,
            id: 0,
            basePrice: int.parse(data.price.replaceAll(RegExp(r'[^0-9]'), "")),
            quantity: int.parse(data.quantity)));
    state = AsyncData([newProduct, ...state.requireValue]);
  }
}
