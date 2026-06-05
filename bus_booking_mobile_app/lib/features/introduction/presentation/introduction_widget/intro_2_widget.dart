import 'package:flutter/material.dart';
import '../../../../core/localization/l10n/app_localizations.dart';

class Intro2Page extends StatelessWidget {
  const Intro2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final langCode = Localizations.localeOf(context).languageCode;
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
              // Headline
              Text(
                AppLocalizations.of(context)!.page2_welcome,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF111827),
                  fontFamily: fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Sub-headline
              Text(
                AppLocalizations.of(context)!.page2_title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0A66FF),
                  fontFamily: fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Features
              _buildFeatureCard(
                context,
                icon: Icons.confirmation_number_outlined,
                text: AppLocalizations.of(context)!.page2_feature1,
                fontFamily: fontFamily,
              ),
              const SizedBox(height: 16),
              _buildFeatureCard(
                context,
                icon: Icons.event_seat_outlined,
                text: AppLocalizations.of(context)!.page2_feature2,
                fontFamily: fontFamily,
              ),
              const SizedBox(height: 16),
              _buildFeatureCard(
                context,
                icon: Icons.payment_outlined,
                text: AppLocalizations.of(context)!.page2_feature3,
                fontFamily: fontFamily,
              ),
              const SizedBox(height: 16),
              _buildFeatureCard(
                context,
                icon: Icons.bolt_outlined,
                text: AppLocalizations.of(context)!.page2_feature4,
                fontFamily: fontFamily,
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
}