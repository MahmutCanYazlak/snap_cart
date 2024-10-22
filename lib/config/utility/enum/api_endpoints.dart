import '../../../core/constants/api_constants.dart';

enum ApiEndpoints {
  getProducts("products"),
  getCategories("categories"),
  postLogin("user/login"),
  ;

  const ApiEndpoints(this.endPoint);
  String get getEndpoint => ApiConstants.baseUrl + endPoint;

  final String endPoint;
}
