import 'package:flutter/material.dart';
import 'splash_repository.dart';
import 'splash_data.dart';
import '../auth/auth_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashRepository repository;
  late final SplashData splashData;

  @override
  void initState() {
    super.initState();
    splashData = SplashData();
    repository = SplashRepository(splashData);
    appStartUp();
  }

  Future<void> appStartUp() async {
    final authProvider = context.read<AuthProvider>();
    await authProvider.syncSessionProvider();
    final hasSeenIntro = await repository.hasSeenIntro();

    final isLoggedIn = authProvider.user != null && authProvider.user!.accessToken.isNotEmpty;

    if (!mounted) return;

    if (hasSeenIntro) {
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, '/main');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    } else {
      Navigator.pushReplacementNamed(context, '/intro');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}