import 'package:ssedisdik/src/features/authentication/models/documents_model.dart';

class DocumentsResponse {
  final String message;
  final String status;
  final bool error;
  final int code;
  final List<DocumentsModel> results;

  DocumentsResponse({
    required this.message,
    required this.status,
    required this.error,
    required this.code,
    required this.results,
  });

  factory DocumentsResponse.fromJson(Map<String, dynamic> json) {
    return DocumentsResponse(
      message: json['message'],
      status: json['status'],
      error: json['error'],
      code: json['code'],
      results: List<DocumentsModel>.from(json['results'].map((x) => DocumentsModel.fromJson(x))),
    );
  }
}