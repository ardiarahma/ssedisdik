import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ssedisdik/src/features/authentication/models/response/login_response.dart';
import 'package:ssedisdik/src/features/authentication/models/user_model.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8000/api';
  static Dio _dio = Dio();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Timer? _sessionTimeoutTimer;
  static const int sessionTimeoutMinutes = 30;

  ApiService() {
    _startSessionTimeoutTimer();
  }

  // -- Initialize session timer
  void _startSessionTimeoutTimer() {
    _sessionTimeoutTimer =
        Timer(Duration(minutes: sessionTimeoutMinutes), logout);
  }

  // -- Reset session timer
  void _resetSessionTimeoutTimer() {
    _sessionTimeoutTimer?.cancel();
    _startSessionTimeoutTimer();
  }

  // void _handleSessionTimeout() {
  //   final snackBar = SnackBar(content: Text('Your session has ended.'));
  //   ScaffoldMessenger.of(_context).showSnackBar(snackBar);

  //   logout();
  // }

  // -- Login
  Future<LoginResponse> login(String email, String password) async {
    final token = await _secureStorage.read(key: 'token');
    try {
      final response = await _dio.post('$baseUrl/login',
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
        _secureStorage.write(
            key: 'userData', value: jsonEncode(loginResponse.user));
        _resetSessionTimeoutTimer();
        return loginResponse;
      } else {
        throw Exception('Login failed');
      }
    } catch (error) {
      throw Exception('Login error: $error');
    }
  }
  // -- Ends of Login

  // -- Logout
  Future<void> logout() async {
    await _secureStorage
        .deleteAll(); // Clear all stored data from secure storage
    _sessionTimeoutTimer?.cancel();
  }
  // -- Ends of Logout

  Future<Map<String, dynamic>> fetchCarouselData() async {
    final token = await _secureStorage.read(key: 'token');
    try {
      final response = await _dio.get(
        '$baseUrl/document-recap',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to fetch carousel data');
      }
    } catch (error) {
      throw Exception('Fetch carousel data error: $error');
    }
  }

  void setAuthToken(String token) {
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
