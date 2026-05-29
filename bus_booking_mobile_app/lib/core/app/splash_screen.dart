import 'package:flutter/material.dart';
import 'splash_repository.dart';
import 'splash_data.dart';


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
    final seenIntro = await repository.hasSeenIntro();
    final session = await repository.getSession();

    if (!seenIntro) {
      Navigator.pushReplacementNamed(context, '/intro');
    } else if (session != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}