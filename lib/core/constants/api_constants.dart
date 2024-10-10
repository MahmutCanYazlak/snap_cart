import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiConstantNotifier = ChangeNotifierProvider<ApiConstants>((ref) {
  return ApiConstants();
});

class ApiConstants extends ChangeNotifier {
  ApiConstants();
  static String baseUrl = "https://dummyjson.com/products";

  Future<String> setBaseUrl(String url) async {
    baseUrl = url;
    notifyListeners();
    return baseUrl;
  }
}
