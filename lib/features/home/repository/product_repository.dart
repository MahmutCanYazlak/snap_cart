import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snap_cart/config/utility/enum/api_endpoints.dart';
import 'package:snap_cart/config/utility/enum/api_methods.dart';
import 'package:snap_cart/core/models/getMethods/products/get_all_categories_model.dart';
import 'package:snap_cart/core/models/getMethods/products/get_alll_products.dart';
import 'package:snap_cart/core/resources/data_state.dart';
import 'package:snap_cart/core/service/remote/api_service.dart';

final productRepositoryProvider = Provider((ref) {
  final apiService = ref.watch(apiServiceNotifier);
  return ProductRepository(apiService);
});

final productsNotifierProvider =
    ChangeNotifierProvider((ref) => ProductsNotifier());

class ProductRepository {
  final ApiService _apiService;
  ProductRepository(this._apiService);

  //Ürünleri getirme
  Future<DataState<List<Product>>> getAllProducts() async {
    try {
      final result = await _apiService.request(
        method: ApiMethods.get.method,
        url: ApiEndpoints.getProducts.getEndpoint,
      );
      if (result.data != null) {
        //bir map değişkeni oluşturduk ve result.data'yı map'e çevirdik
        final Map<String, dynamic> map = result.data as Map<String, dynamic>;
        //map değişkenini GetAllProducts.fromMap fonksiyonuna gönderdik ve geriye GetAllProducts objesi döndük
        final GetAllProducts getAllProducts = GetAllProducts.fromMap(map);
        //getAllProducts objesinin products değişkenini döndük
        return DataSuccess(data: getAllProducts.products);
      } else {
        return DataError(message: result.message);
      }
    } catch (e) {
      return DataError(message: e.toString());
    }
  }

  Future<DataState<List<GetAllCategoriesModel>>> getAllCategories() async {
    try {
      final result = await _apiService.request(
        method: ApiMethods.get.method,
        url: ApiEndpoints.getCategories.getEndpoint,
      );
      if (result.data != null) {
        final List<dynamic> list = result.data as List<dynamic>;
        final List<GetAllCategoriesModel> categories = list
            .map((item) =>
                GetAllCategoriesModel.fromMap(item as Map<String, dynamic>))
            .toList();
        return DataSuccess(data: categories);
      } else {
        return DataError(message: result.message ?? 'Bir hata oluştu');
      }
    } catch (e) {
      return DataError(message: e.toString());
    }
  }
}

class ProductsNotifier extends ChangeNotifier {
  Future<List<Product>> _products = Future.value([]);

  //get
  Future<List<Product>> get products => _products;

  //set
  void setProducts(Future<List<Product>> products) {
    _products = products;
    notifyListeners();
  }
}
