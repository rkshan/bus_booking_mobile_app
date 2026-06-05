import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import '../../../../core/app/splash_repository.dart';
import '../../../../core/app/splash_data.dart';
import '../../../../core/auth/auth_provider.dart';

class Intro3Page extends StatelessWidget {
  const Intro3Page({super.key});

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
                AppLocalizations.of(context)!.page3_welcome,
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
                AppLocalizations.of(context)!.page3_title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0A66FF),
                  fontFamily: fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Steps
              _buildStepCard(
                context,
                stepNumber: "1",
                icon: Icons.search_rounded,
                text: AppLocalizations.of(context)!.page3_step1,
                fontFamily: fontFamily,
              ),
              const SizedBox(height: 16),
              _buildStepCard(
                context,
                stepNumber: "2",
                icon: Icons.event_seat_rounded,
                text: AppLocalizations.of(context)!.page3_step2,
                fontFamily: fontFamily,
              ),
              const SizedBox(height: 16),
              _buildStepCard(
                context,
                stepNumber: "3",
                icon: Icons.directions_bus_rounded,
                text: AppLocalizations.of(context)!.page3_step3,
                fontFamily: fontFamily,
              ),
              const SizedBox(height: 40),

              // Get Started Button
              GestureDetector(
                onTap: () async {
                  // set seenIntro to true in shared preferences to avoid intro screen in future
                  final splashRepo = SplashRepository(SplashData());
                  await splashRepo.setSeenIntro(true);

                  if (!context.mounted) return;

                  final authProvider = context.read<AuthProvider>();
                  if (authProvider.user != null) {
                    Navigator.pushReplacementNamed(context, '/main');
                  } else {
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0A66FF),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0A66FF).withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.page3_button,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: fontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard(
    BuildContext context, {
    required String stepNumber,
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
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  icon,
                  color: const Color(0xFF0A66FF),
                  size: 24,
                ),
                Positioned(
                  right: 2,
                  bottom: 2,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: Color(0xFF0A66FF),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      stepNumber,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
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
