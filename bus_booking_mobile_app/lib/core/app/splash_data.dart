import 'package:shared_preferences/shared_preferences.dart';

class SplashData {
  Future<bool> hasSeenIntro() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('seenIntro') ?? false;
  }
}