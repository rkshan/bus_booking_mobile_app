import 'package:flutter/material.dart';
import '../../../core/localization/language_controller.dart';
import 'package:provider/provider.dart';
import "../../../core/localization/l10n/app_localizations.dart";
import 'login_widget/common_text_input_widget.dart';
import 'login_widget/common_button_widget.dart';
import '../../../core/auth/auth_provider.dart';
import '../../../core/app/splash_repository.dart';
import '../../../core/app/splash_data.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final langCode = context
        .watch<LanguageController>()
        .currentLocale
        .languageCode;
    final fontSizeGreeting = langCode == 'si'
        ? 18.0
        : langCode == 'ta'
        ? 18.0
        : 24.0;
    final fontSizeContent = langCode == 'si' || langCode == 'ta' ? 16.0 : 16.0;
    final fontFamily = langCode == 'si'
        ? 'NotoSansSinhala'
        : langCode == 'ta'
        ? 'NotoSansTamil'
        : null;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.login_screen_welcome,
          style: TextStyle(
            fontSize: fontSizeGreeting,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              AppLocalizations.of(context)!.login_screen_title,
              style: TextStyle(
                fontSize: fontSizeContent,
                fontFamily: fontFamily,
              ),
            ),

            Text(
              AppLocalizations.of(context)!.login_screen_subtitle,
              style: TextStyle(
                fontSize: fontSizeContent,
                fontFamily: fontFamily,
              ),
            ),

            CommonTextInputWidget(
              text: AppLocalizations.of(context)!.login_screen_email_hint,
              label: AppLocalizations.of(context)!.login_screen_email_label,
              onChanged: (value) {
                context.read<AuthProvider>().setEmail(value);
              },
              textStyle: TextStyle(
                fontSize: fontSizeContent,
                fontFamily: fontFamily,
              ),
              status: false,
            ),

            CommonTextInputWidget(
              text: AppLocalizations.of(context)!.login_screen_password_hint,
              label: AppLocalizations.of(context)!.login_screen_password_label,
              onChanged: (value) {
                context.read<AuthProvider>().setPassword(value);
              },
              textStyle: TextStyle(
                fontSize: fontSizeContent,
                fontFamily: fontFamily,
              ),
              status: true,
            ),

            Text(
              AppLocalizations.of(context)!.login_screen_forgot_password,
              style: TextStyle(
                fontSize: fontSizeContent,
                fontFamily: fontFamily,
              ),
            ),

            Consumer<AuthProvider>(
              builder: (context, auth, child) {
                if (auth.user != null &&
                    auth.user!.accessToken.isNotEmpty &&
                    auth.user!.userId.isNotEmpty) {
                  Future.microtask(() {
                    Navigator.pushReplacementNamed(context, '/home');
                  });
                }

                if (auth.errorMessage != null) {
                  Future.microtask(() {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(auth.errorMessage!)));
                  });
                }

                return CommonButtonWidget(
                  text: auth.isLoading
                      ? "Loading..."
                      : AppLocalizations.of(context)!.login_screen_button,

                  onPressed: auth.isLoading
                      ? null
                      : () {
                          context.read<AuthProvider>().loginProvider();
                        },

                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),

            CommonButtonWidget(
              text: "setting up intro screen",

              onPressed: () async {
                final splashRepo = SplashRepository(SplashData());
                await splashRepo.setSeenIntro(false);
              },

              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              AppLocalizations.of(context)!.login_screen_no_account,
              style: TextStyle(
                fontSize: fontSizeContent,
                fontFamily: fontFamily,
              ),
            ),

            Text(
              AppLocalizations.of(context)!.login_screen_register_now,
              style: TextStyle(
                fontSize: fontSizeContent,
                fontFamily: fontFamily,
              ),
            ),

            Text(
              AppLocalizations.of(context)!.login_screen_or_continue,
              style: TextStyle(
                fontSize: fontSizeContent,
                fontFamily: fontFamily,
              ),
            ),

            Text(
              AppLocalizations.of(context)!.login_screen_google_login,
              style: TextStyle(
                fontSize: fontSizeContent,
                fontFamily: fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
