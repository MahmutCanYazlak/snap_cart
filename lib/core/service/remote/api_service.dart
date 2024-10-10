import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../resources/data_state.dart';

final apiServiceNotifier = ChangeNotifierProvider<ApiService>((ref) {
  return ApiService(Dio());
});
//!Kullanma
// final apiServiceProvider = Provider(
//   (ref) => ApiService(
//     Dio(),
//   ),
// );

class ApiService extends ChangeNotifier {
  final Dio _dio;
  String encodedData = "";
  ApiService(this._dio);

  Future<DataState<dynamic>> request({
    required String method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final headerAuth = "Basic $encodedData";
      final response = await _dio.request(
        url,
        data: data,
        queryParameters: query,
        onSendProgress: (int sent, int total) {
          // log("$sent $total");
        },
        options: Options(
          sendTimeout: const Duration(milliseconds: 55000000000000),
          method: method,
          contentType: "application/json",
          maxRedirects: 5,
          receiveTimeout: const Duration(milliseconds: 5500000000000),
          responseType: ResponseType.json,
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
          headers: {
            'accept': '*/*',
            'Authorization': headerAuth,
          },
        ),
      );
      if (response.statusCode == 200) {
        return DataSuccess(data: response.data);
      } else {
        return DataError(message: "Hata");
      }
    } on DioException catch (e) {
      return DataError(message: e.message);
    }
  }

  Future<DataState<dynamic>> currencyRequest({
    required String method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.request(
        url,
        data: data,
        queryParameters: query,
        onSendProgress: (int sent, int total) {},
        options: Options(
          sendTimeout: const Duration(milliseconds: 55000),
          method: method,
          contentType: "application/json",
          maxRedirects: 5,
          receiveTimeout: const Duration(milliseconds: 55000),
          responseType: ResponseType.json,
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200) {
        return DataSuccess(data: response.data);
      } else {
        return DataError(message: response.statusMessage);
      }
    } on DioException catch (e) {
      return DataError(message: e.message);
    }
  }

  Future<void> setUser(String username, String password) async {
    String userData = "$username:$password";
    encodedData = base64.encode(utf8.encode(userData));
    notifyListeners();
  }
}
