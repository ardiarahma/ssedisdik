import 'package:ssedisdik/src/features/authentication/models/user_model.dart';

class LoginResponse{
  final String accessToken;
  final String tokenType;
  final User user;
  final int expiresIn;

  LoginResponse({
    required this.accessToken,
    required this.tokenType,
    required this.user,
    required this.expiresIn
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      user: User.fromJson(json['user']),
      expiresIn: json['expires_in'],
    );
  }
}