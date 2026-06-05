import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/localization/language_controller.dart';
import '../../../../core/localization/l10n/app_localizations.dart';

class LanguageSelectorWidget extends StatelessWidget {
  const LanguageSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = context.watch<LanguageController>();
    final currentLocale = languageController.currentLocale;
    final langCode = currentLocale.languageCode;

    String? fontFamily = langCode == 'si'
        ? 'NotoSansSinhala'
        : langCode == 'ta'
            ? 'NotoSansTamil'
            : null;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Main Headline: Welcome to QuickBus
              Text(
                AppLocalizations.of(context)!.page1_welcome,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF111827),
                  fontFamily: fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Sub-headline: Travel Made Simple
              Text(
                AppLocalizations.of(context)!.page1_title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0A66FF),
                  fontFamily: fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  AppLocalizations.of(context)!.page1_subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF4B5563),
                    height: 1.5,
                    fontFamily: fontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),

              // Feature Cards
              _buildFeatureCard(
                context,
                icon: Icons.directions_bus_rounded,
                text: AppLocalizations.of(context)!.page1_highlight1,
                fontFamily: fontFamily,
              ),
              const SizedBox(height: 16),
              _buildFeatureCard(
                context,
                icon: Icons.language_rounded,
                text: AppLocalizations.of(context)!.page1_highlight2,
                fontFamily: fontFamily,
              ),
              const SizedBox(height: 16),
              _buildFeatureCard(
                context,
                icon: Icons.shield_outlined,
                text: AppLocalizations.of(context)!.page1_highlight3,
                fontFamily: fontFamily,
              ),
              const SizedBox(height: 32),

              // Language selector buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLanguageButton(
                    context,
                    text: AppLocalizations.of(context)!.langEnglish,
                    locale: const Locale('en', 'US'),
                    currentLocale: currentLocale,
                  ),
                  const SizedBox(width: 12),
                  _buildLanguageButton(
                    context,
                    text: AppLocalizations.of(context)!.langSinhala,
                    locale: const Locale('si', 'LK'),
                    currentLocale: currentLocale,
                  ),
                  const SizedBox(width: 12),
                  _buildLanguageButton(
                    context,
                    text: AppLocalizations.of(context)!.langTamil,
                    locale: const Locale('ta', 'LK'),
                    currentLocale: currentLocale,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String text,
    String? fontFamily,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Color(0xFFEFF6FF),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: const Color(0xFF0A66FF),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1F2937),
                fontFamily: fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageButton(
    BuildContext context, {
    required String text,
    required Locale locale,
    required Locale currentLocale,
  }) {
    final isSelected = currentLocale.languageCode == locale.languageCode;

    return GestureDetector(
      onTap: () {
        context.read<LanguageController>().changeLanguage(locale);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0A66FF) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: isSelected
              ? null
              : Border.all(color: const Color(0xFFE5E7EB), width: 1.0),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF0A66FF).withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF4B5563),
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: locale.languageCode == 'si'
                ? 'NotoSansSinhala'
                : locale.languageCode == 'ta'
                    ? 'NotoSansTamil'
                    : null,
          ),
        ),
      ),
    );
  }
}
