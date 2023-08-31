import 'package:ssedisdik/src/features/authentication/models/documents_result_model.dart';

class DocumentApiResponse {
  final String message;
  final String status;
  final bool error;
  final int code;
  final DocumentResult results;

  DocumentApiResponse({
    required this.message,
    required this.status,
    required this.error,
    required this.code,
    required this.results,
  });

  factory DocumentApiResponse.fromJson(Map<String, dynamic> json) {
    return DocumentApiResponse(
      message: json['message'],
      status: json['status'],
      error: json['error'],
      code: json['code'],
      results: DocumentResult.fromJson(json['results']),
    );
  }
}