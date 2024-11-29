import '../../../core/constants/api_constants.dart';

enum ApiEndpoints {
  getProducts("products"),
  getCategories("products/categories"),
  postLogin("user/login"),
  getProductsByCategory("products/category/"),
  ;

  const ApiEndpoints(this.endPoint);
  String get getEndpoint => ApiConstants.baseUrl + endPoint;

  final String endPoint;
}
