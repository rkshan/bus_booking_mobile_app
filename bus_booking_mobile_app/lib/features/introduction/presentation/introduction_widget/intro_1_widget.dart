import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/localization/language_controller.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import 'common_button_widget.dart';

class LanguageSelectorWidget extends StatelessWidget {
  const LanguageSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final langCode = Localizations.localeOf(context).languageCode;
    final fontSizeGreeting = langCode == 'si' ? 22.0 : langCode == 'ta' ? 22.0 : 24.0;
    final fontSizeContent = langCode == 'si' || langCode == 'ta' ? 15.0 : 16.0;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            AppLocalizations.of(context)!.page1_welcome,
            style: TextStyle(
              fontSize: fontSizeGreeting,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center
          ),

          Text(
            AppLocalizations.of(context)!.page1_title,
            style: TextStyle(
              fontSize: fontSizeContent,
              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            AppLocalizations.of(context)!.page1_subtitle,
            style: TextStyle(
              fontSize: fontSizeContent,
              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            AppLocalizations.of(context)!.page1_highlight1,
            style: TextStyle(
              fontSize: fontSizeContent,
              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            AppLocalizations.of(context)!.page1_highlight2,
            style: TextStyle(
              fontSize: fontSizeContent,
              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            AppLocalizations.of(context)!.page1_highlight3,
            style: TextStyle(
              fontSize: fontSizeContent,
              fontWeight: FontWeight.w600,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              CommonButtonWidget(
                text: AppLocalizations.of(context)!.langEnglish,
                onPressed: () {
                  context.read<LanguageController>().changeLanguage(
                    const Locale('en', 'US'),
                  );
                },
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSans',
                ),
              ),

              const SizedBox(width: 10),

              CommonButtonWidget(
                text: AppLocalizations.of(context)!.langSinhala,
                onPressed: () {
                  context.read<LanguageController>().changeLanguage(
                    const Locale('si', 'LK'),
                  );
                },
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSansSinhala',
                ),
              ),

              const SizedBox(width: 10),

              CommonButtonWidget(
                text: AppLocalizations.of(context)!.langTamil,
                onPressed: () {
                  context.read<LanguageController>().changeLanguage(
                    const Locale('ta', 'LK'),
                  );
                },
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSansTamil',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
