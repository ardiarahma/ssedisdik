import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ssedisdik/src/features/authentication/models/documents_categories_model.dart';
import 'package:ssedisdik/src/features/authentication/models/response/login_response.dart';

import '../features/authentication/models/documents_model.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8000/api';
  static final Dio _dio = Dio();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

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
  // -- Ends of Get Documents Lists

  // -- Get Documents Category's Data
  Future<List<DocCategoriesModel>> fetchDocumentCategories({
    String? term,
    int? take,
    int? skip,
  }) async {
    final token = await _secureStorage.read(key: 'token');
    try {
      final response = await _dio.get(
        '$baseUrl/category',
        queryParameters: {
          if (term != null) 'term': term,
          if (take != null) 'take': take,
          if (skip != null) 'skip': skip,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data['results'];
        final List<DocCategoriesModel> categories = responseData
            .map((json) => DocCategoriesModel.fromJson(json))
            .toList();
        return categories;
      } else {
        throw Exception('Failed to fetch document categories');
      }
    } catch (error) {
      throw Exception('Fetch document categories error: $error');
    }
  }

  // -- Ends of Fetch Documents Category's Data

  // -- Upload Documents
  // Future<DocumentApiResponse> postDocumentData({
  //   Map<String, dynamic> requestData,
  // }) async {
  //   final token = await _secureStorage.read(key: 'token');
  //   try {
  //     final response = await _dio.post(
  //       '$baseUrl/your-post-endpoint', // Update with your actual POST endpoint
  //       data: requestData,
  //       options: Options(
  //         headers: {'Authorization': 'Bearer $token'},
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       final documentApiResponse = DocumentApiResponse.fromJson(response.data);
  //       return documentApiResponse;
  //     } else {
  //       throw Exception('Failed to post document data');
  //     }
  //   } catch (error) {
  //     throw Exception('Post document data error: $error');
  //   }
  // }
  // -- Ends of Upload Documents
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
