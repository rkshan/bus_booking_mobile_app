import 'package:supabase_flutter/supabase_flutter.dart';

class AuthData {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<AuthResponse> loginApiCall(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      email: "8dinukavc@gmail.com",
      password: "12345678",
    );
    return response;
  }

  Future<void> logoutApiCall() async {
    await supabase.auth.signOut();
  }

  Session? getCurrentSessionApiCall() {
    return supabase.auth.currentSession;
  }
}