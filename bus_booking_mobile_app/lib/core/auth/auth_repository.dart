import 'auth_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {

  final AuthData authData;
  AuthRepository(this.authData);
  
  Future<AuthModel> loginRepo(String email, String password) async {
    final response = await authData.loginApiCall(email, password);
    final session = response.session;
    final user = response.user;

    if (session == null || user == null) {
      throw Exception("Login failed");
    }

    return AuthModel(
      userId: user.id,
      email: user.email ?? '',
      accessToken: session.accessToken,
    );
  }

  Future<void> logoutRepo() async {
    await authData.logoutApiCall();
  }

  AuthModel? getCurrentUserRepo() {
    final session = authData.getCurrentSessionApiCall();

    if (session == null) return null;

    final user = session.user;

    return AuthModel(
      userId: user.id,
      email: user.email ?? '',
      accessToken: session.accessToken,
    );
  }
}