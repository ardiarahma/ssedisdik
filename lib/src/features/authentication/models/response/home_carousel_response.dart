class HomeCarouselResponse{
  final String message;
  final String status;
  final bool error;
  final int code;
  final Map<String, int> docResults;

  HomeCarouselResponse({
    required this.message,
    required this.status,
    required this.error,
    required this.code,
    required this.docResults,
  });

  factory HomeCarouselResponse.fromJson(Map<String, dynamic> json) {
    return HomeCarouselResponse(
      message: json['message'],
      status: json['status'],
      error: json['error'],
      code: json['code'],
      docResults: (json['results'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, value as int)),
    );
  }
}