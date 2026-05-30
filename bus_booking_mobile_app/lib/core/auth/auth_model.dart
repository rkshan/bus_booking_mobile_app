class AuthModel {
  final String userId;
  final String email;
  final String accessToken;

  AuthModel({
    required this.userId,
    required this.email,
    required this.accessToken,
  });
}