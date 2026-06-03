import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/localization/language_controller.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import 'common_button_widget.dart';

class Intro2Page extends StatelessWidget {
  const Intro2Page({super.key});

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
            AppLocalizations.of(context)!.page2_welcome,
            style: TextStyle(
              fontSize: fontSizeGreeting,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center
          ),

          Text(
            AppLocalizations.of(context)!.page2_title,
            style: TextStyle(
              fontSize: fontSizeContent,
              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            AppLocalizations.of(context)!.page2_feature1,
            style: TextStyle(
              fontSize: fontSizeContent,
              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            AppLocalizations.of(context)!.page2_feature2,
            style: TextStyle(
              fontSize: fontSizeContent,
              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            AppLocalizations.of(context)!.page2_feature3,
            style: TextStyle(
              fontSize: fontSizeContent,
              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            AppLocalizations.of(context)!.page2_feature4,
            style: TextStyle(
              fontSize: fontSizeContent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}