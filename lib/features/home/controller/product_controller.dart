import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snap_cart/core/models/getMethods/get_alll_products.dart';
import 'package:snap_cart/features/home/repository/product_repository.dart';

final productControllerProvider = Provider((ref) {
  final invoiceRepository = ref.watch(productRepositoryProvider);
  return ProductController(invoiceRepository);
});

final getAllProductsProvider = FutureProvider<GetAllProducts>((ref) async {
  final controller = ref.read(productControllerProvider);
  return controller.getAllProducts();
});

class ProductController {
  final ProductRepository _productRepository;
  ProductController(this._productRepository);

  Future<GetAllProducts> getAllProducts() async {
    try {
      return await _productRepository.getAllProducts();
    } catch (e) {
      throw Exception(e);
    }
  }
}
