import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:wms/src/core/provider/repo.dart';
import 'package:wms/src/domain/entities/entities.dart';

final productControllerProvider =
    AsyncNotifierProvider<ProductController, List<Product>>(
        ProductController.new);

class ProductController extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() async {
    final res = await ref.read(productRepoProvider).getProducts();
    return res;
  }
}
