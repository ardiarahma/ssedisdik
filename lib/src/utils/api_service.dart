import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ssedisdik/src/features/authentication/models/response/login_response.dart';
import 'package:ssedisdik/src/features/authentication/models/user_model.dart';

import '../features/authentication/models/documents_model.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8000/api';
  static Dio _dio = Dio();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

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

  // -- Saving Auth Token
  void setAuthToken(String token) {
    _secureStorage.write(key: 'authToken', value: token);
    _dio.interceptors.add(AuthInterceptor(token));
  }
  // -- Ends of Saving Auth Token

  // -- Get Documents Lists
  Future<List<DocumentsModel>> fetchPaginatedAndFilteredDocuments({
    required int page,
    required int take,
    required int skip,
    String? term,
    String? status,
  }) async {
    final token = await _secureStorage.read(key: 'token');
    try {
      final response = await _dio.get(
        '$baseUrl/document',
        queryParameters: {
          'page': page,
          'take': take,
          'skip': skip,
          if (term != null) 'term': term,
          if (status != null) 'status': status,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data['results'];
        final List<DocumentsModel> documents =
            responseData.map((json) => DocumentsModel.fromJson(json)).toList();
        return documents;
      } else {
        throw Exception('Failed to fetch paginated and filtered documents');
      }
    } catch (error) {
      throw Exception('Fetch documents error: $error');
    }
  }
  // -- Ends of Gets Documents Lists


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
