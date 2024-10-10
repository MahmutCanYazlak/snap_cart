import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiConstantsNotifierProvider =
    ChangeNotifierProvider((ref) => ApiConstantsNotifier());

class ApiConstantsNotifier extends ChangeNotifier {
  String _baseUrl = 'https://api.escuelajs.co/api/v1/';
  String get baseUrl => _baseUrl;

  void setBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
    notifyListeners();
  }
}
