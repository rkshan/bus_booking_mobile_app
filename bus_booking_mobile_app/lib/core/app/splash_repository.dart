import 'splash_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashRepository {
  final SplashData splashData;
  SplashRepository(this.splashData);
  final session = Supabase.instance.client.auth.currentSession;

  Future<bool> hasSeenIntro() async {
    return await splashData.hasSeenIntro();
  }

  Future<void> setSeenIntro(bool value) async {
    await splashData.setSeenIntro(value);
  }

  Future<Session?> getSession() async {
    final session = Supabase.instance.client.auth.currentSession;
    return session;
  }
}