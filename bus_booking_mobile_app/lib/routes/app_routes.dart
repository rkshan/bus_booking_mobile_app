import 'package:flutter/material.dart';
import '../features/introduction/presentation/introduction_screen.dart';
import '../features/login/presentation/login_screen.dart';
import '../core/app/splash_screen.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const SplashScreen(),
    '/intro': (context) => const IntroductionScreen(),
    '/login': (context) => const LoginScreen(),
  };
}