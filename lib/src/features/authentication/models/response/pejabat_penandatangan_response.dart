import 'package:ssedisdik/src/features/authentication/models/pejabat_model.dart';

class PejabatAPIResponse {
  final String message;
  final String status;
  final bool error;
  final int code;
  final List<PejabatModel> results;

  PejabatAPIResponse({
    required this.message,
    required this.status,
    required this.error,
    required this.code,
    required this.results,
  });

  factory PejabatAPIResponse.fromJson(Map<String, dynamic> json) {
    final resultsList = json['results'] as List<dynamic>;
    final List<PejabatModel> results = resultsList
        .map((result) => PejabatModel.fromJson(result))
        .toList();

    return PejabatAPIResponse(
      message: json['message'] as String,
      status: json['status'] as String,
      error: json['error'] as bool,
      code: json['code'] as int,
      results: results,
    );
  }
}
