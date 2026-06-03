import '../features/introduction/presentation/introduction_screen.dart';
import '../features/login/presentation/login_screen.dart';
import '../core/app/splash_screen.dart';
import '../features/main/presentation/main_screen.dart';
import '../core/auth/auth_guard.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const SplashScreen(),
    '/intro': (context) => const IntroductionScreen(),
    '/login': (context) => const LoginScreen(),

    // protected routes
    '/main': (context) => const AuthGuard(
          child: MainScreen(),
        ),
  };
}