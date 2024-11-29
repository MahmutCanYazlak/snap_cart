import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../resources/data_state.dart';

final apiServiceNotifier = ChangeNotifierProvider<ApiService>((ref) {
  return ApiService(Dio());
});

class ApiService extends ChangeNotifier {
  final Dio _dio;

  String? _bearerToken = "";

  ApiService(this._dio);

  Future<DataState<dynamic>> request({
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
        onSendProgress: _logProgress,
        options: _buildOptions(method),
      );

      if (response.statusCode == 200) {
        Logger().w("Response: ${response.data}");
        return DataSuccess(data: response.data);
      } else {
        return DataError(
          message: response.statusMessage ?? "Unexpected error occurred",
        );
      }
    } on DioException catch (e) {
      Logger().e(e);
      return DataError(message: e.message ?? "DioException occurred");
    } catch (e) {
      Logger().e(e);
      return DataError(message: "An unexpected error occurred: $e");
    }
  }

  Options _buildOptions(String method) {
    return Options(
      method: method,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Authorization": "Bearer $_bearerToken",
      },
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      followRedirects: false,
      validateStatus: (status) => status != null && status < 500,
    );
  }

  void updateBearerToken(String? token) {
    _bearerToken = token;
    notifyListeners();
  }

  void _logProgress(int sent, int total) {
    if (kDebugMode) {
      Logger()
          .i("Upload progress: ${((sent / total) * 100).toStringAsFixed(2)}%");
    }
  }
}
