import '../features/introduction/presentation/introduction_screen.dart';
import '../features/login/presentation/login_screen.dart';
import '../core/app/splash_screen.dart';
import '../features/home/presentation/home_screen.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const SplashScreen(),
    '/intro': (context) => const IntroductionScreen(),
    '/login': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
  };
}