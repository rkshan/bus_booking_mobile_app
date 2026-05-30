import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends ChangeNotifier {
  Locale _currentLocale = const Locale('en', 'US');
  Locale get currentLocale => _currentLocale;

  Future<void> loadSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLocale = prefs.getString('locale');
    if (savedLocale != null) {
      List<String> localeParts = savedLocale.split('_');
      if (localeParts.length == 2) {
        _currentLocale = Locale(localeParts[0], localeParts[1]);
        notifyListeners();
      }
    }
  }

  Future<void> changeLanguage(Locale newLocale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', '${newLocale.languageCode}_${newLocale.countryCode}');
    _currentLocale = newLocale;
    notifyListeners();
  }

}