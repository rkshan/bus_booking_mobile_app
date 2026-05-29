import 'splash_data.dart';

class SplashRepository {
  final SplashData splashData;
  SplashRepository(this.splashData);

  Future<bool> hasSeenIntro() async {
    return await splashData.hasSeenIntro();
  }

  Future<void> setSeenIntro(bool value) async {
    await splashData.setSeenIntro(value);
  }
}