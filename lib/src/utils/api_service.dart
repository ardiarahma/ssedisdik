import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ssedisdik/src/features/authentication/models/response/login_response.dart';
import 'package:ssedisdik/src/features/authentication/models/user_model.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8000/api';
  static Dio _dio = Dio();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<LoginResponse> login(String email, String password) async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');

    try {
      final response = await _dio.post(
          '$baseUrl/login', // Replace with your API login endpoint
          data: {
            'email': email,
            'password': password,
          },
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));

      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(response.data);
        setAuthToken(loginResponse.accessToken);
        return loginResponse;
      } else {
        throw Exception('Login failed');
      }
    } catch (error) {
      throw Exception('Login error: $error');
    }
  }

  void setAuthToken(String token){
    _secureStorage.write(key: 'authToken', value: token);
    _dio.interceptors.add(AuthInterceptor(token));
  }
}

class AuthInterceptor extends Interceptor {
  final String accessToken;

  AuthInterceptor(this.accessToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $accessToken';
    super.onRequest(options, handler);
  }
}
