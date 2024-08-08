import 'package:dio/dio.dart';

class AuthProvider {
  final Dio _dio = Dio();
  String? _accessToken;

  Future<void> login(String uid, String token) async {
    final response = await _dio.post(
      'https://apidev.pocmenu.com/menuboard/api/auth/admin/sign',
      data: {
        "uid": uid,
        "token": token,
      },
    );
    if (response.data['code'] == '00') {
      _accessToken = response.data['data']['accessToken'];
      _dio.options.headers['Authorization'] = 'Bearer $_accessToken';
    } else {
      throw Exception('Login failed: ${response.data['message']}');
    }
  }

  Dio get dio => _dio;
}
