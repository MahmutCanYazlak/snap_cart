import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snap_cart/config/utility/enum/api_endpoints.dart';
import 'package:snap_cart/config/utility/enum/api_methods.dart';
import 'package:snap_cart/core/models/auth/user_model.dart';
import 'package:snap_cart/core/resources/data_state.dart';
import 'package:snap_cart/core/service/remote/api_service.dart';

final authRepositoryProvider = Provider((ref) {
  final apiService = ref.watch(apiServiceNotifier);
  return AuthRepository(apiService);
});

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  Future<DataState<UserModel>> login(
      {required String email, required String password}) async {
    try {
      final result = await _apiService.currencyRequest(
        method: ApiMethods.post.method,
        url: ApiEndpoints.postLogin.getEndpoint,
        data: {
          "username": email,
          "password": password,
        },
      );

      if (result is DataSuccess) {
        final Map<String, dynamic> map = result.data as Map<String, dynamic>;
        final UserModel userModel = UserModel.fromMap(map);
        return DataSuccess(data: userModel);
      } else {
        return DataError(message: "Giriş başarısız.");
      }
    } on DioException catch (e) {
      return DataError(message: e.toString());
    }
  }
}
