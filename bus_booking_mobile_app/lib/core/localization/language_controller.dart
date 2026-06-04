import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends ChangeNotifier {
  Locale _currentLocale = const Locale('en', 'US');
  Locale get currentLocale => _currentLocale;
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> loadSavedLanguage() async {
    _isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLocale = prefs.getString('locale');
    if (savedLocale != null) {
      List<String> localeParts = savedLocale.split('_');
      if (localeParts.length == 2) {
        _currentLocale = Locale(localeParts[0], localeParts[1]);
      }
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> changeLanguage(Locale newLocale) async {
    if(newLocale == _currentLocale) return;
    _isLoading = true;
    notifyListeners();
    // allow to render the loading UI
    await Future.delayed(const Duration(milliseconds: 1000));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', '${newLocale.languageCode}_${newLocale.countryCode}');
    _currentLocale = newLocale;
     _isLoading = false;
    notifyListeners();
  }

}