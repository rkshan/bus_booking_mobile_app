import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/localization/language_controller.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import 'common_button_widget.dart';
import '../../../../core/app/splash_repository.dart';
import '../../../../core/app/splash_data.dart';

class Intro3Page extends StatelessWidget {
  const Intro3Page({super.key});

  @override
  Widget build(BuildContext context) {
    final langCode = context
        .watch<LanguageController>()
        .currentLocale
        .languageCode;
    final fontSizeGreeting = langCode == 'si'
        ? 22.0
        : langCode == 'ta'
        ? 22.0
        : 24.0;
    final fontSizeContent = langCode == 'si' || langCode == 'ta' ? 15.0 : 16.0;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            AppLocalizations.of(context)!.page3_welcome,
            style: TextStyle(
              fontSize: fontSizeGreeting,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          Text(
            AppLocalizations.of(context)!.page3_title,
            style: TextStyle(
              fontSize: fontSizeContent,
              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            AppLocalizations.of(context)!.page3_step1,
            style: TextStyle(
              fontSize: fontSizeContent,
              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            AppLocalizations.of(context)!.page3_step2,
            style: TextStyle(
              fontSize: fontSizeContent,
              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            AppLocalizations.of(context)!.page3_step3,
            style: TextStyle(
              fontSize: fontSizeContent,
              fontWeight: FontWeight.w600,
            ),
          ),

          CommonButtonWidget(
            text: AppLocalizations.of(context)!.page3_button,
            onPressed: () async {
              // set seenIntro to true in shared preferences to avoid intro screen in future
              final splashRepo = SplashRepository(SplashData());
              await splashRepo.setSeenIntro(true);
              // navigate to home screen
              Navigator.pushReplacementNamed(context, '/login');

            },
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: langCode == 'si'
                  ? 'NotoSansSinhala'
                  : langCode == 'ta'
                  ? 'NotoSansTamil'
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
