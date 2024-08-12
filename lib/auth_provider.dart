import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'menu_network.dart';
import 'auth_response.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String get token => _token ?? '';

  final Dio _dio = Dio();
  late final MenuNetwork _menuNetwork;

  AuthProvider() {
    _menuNetwork = MenuNetwork(_dio);
  }

  Future<String> login() async {
    if (_token != null && _token!.isNotEmpty) {
      return _token!;
    }

    try {
      Map<String, dynamic> requestBody = {
        "token": "",
        "uid": ""
      };

      AuthResponse response = await _menuNetwork.login(requestBody);
      _token = response.accessToken;

      // 로그인 성공 후 다른 API 호출 시 토큰 사용 가능
      _dio.options.headers['Authorization'] = "Bearer $_token";

      notifyListeners();
      return _token!;
    } catch (e) {
      debugPrint('Error during login: $e');
      rethrow;
    }
  }

  void logout() {
    _token = null;
    _dio.options.headers.remove('Authorization');
    notifyListeners();
  }
}
