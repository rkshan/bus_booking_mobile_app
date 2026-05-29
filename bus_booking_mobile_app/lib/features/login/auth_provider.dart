import 'package:flutter/material.dart';
import '../../core/auth/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/auth/auth_model.dart';

class AuthProvider extends ChangeNotifier {

  final AuthRepository authRepository;
  AuthProvider(this.authRepository);

  String email = '';
  String password = '';
  bool isLoading = false;
  AuthModel? user;
  String? errorMessage;

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<void> loginProvider() async {

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      user = await authRepository.loginRepo(email, password);
    } catch (e) {
      errorMessage = e.toString();
      user = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}