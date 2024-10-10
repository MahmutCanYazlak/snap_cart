import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snap_cart/config/utility/enum/api_endpoints.dart';
import 'package:snap_cart/config/utility/enum/api_methods.dart';
import 'package:snap_cart/core/models/getMethods/get_alll_products.dart';
import 'package:snap_cart/core/resources/data_state.dart';
import 'package:snap_cart/core/service/remote/api_service.dart';

final productRepositoryProvider = Provider((ref) {
  final apiService = ref.watch(apiServiceNotifier);
  return ProductRepository(apiService);
});

class ProductRepository {
  final ApiService _apiService;
  ProductRepository(this._apiService);

  //Ürünleri getirme
  Future<DataState<GetAllProducts>> getAllProducts() async {
    try {
      final result = await _apiService.currencyRequest(
        method: ApiMethods.get.method,
        url: ApiEndpoints.getProducts.getEndpoint,
      );
      if (result.data != null) {
        final products = GetAllProducts.fromMap(result.data);
        return DataSuccess(data: products);
      } else {
        return DataError(message: result.message);
      }
    } catch (e) {
      return DataError(message: e.toString());
    }
  }
}

