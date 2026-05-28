import 'splash_data.dart';

class SplashRepository {
  final SplashData splashData;
  SplashRepository(this.splashData);

  Future<bool> hasSeenIntro() async {
    return await splashData.hasSeenIntro();
  }
}