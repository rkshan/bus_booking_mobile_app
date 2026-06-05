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
    final langCode = Localizations.localeOf(context).languageCode;
    final fontSizeGreeting = langCode == 'si' || langCode == 'ta' ? 36.0 : 48.0;
    final fontSizeContent = langCode == 'si' || langCode == 'ta' ? 14.0 : 16.0;
    final fontFamily = langCode == 'si'
        ? 'NotoSansSinhala'
        : langCode == 'ta'
            ? 'NotoSansTamil'
            : null;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Text(
                AppLocalizations.of(context)!.login_screen_welcome,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSizeGreeting,
                  fontWeight: FontWeight.w800,
                  fontFamily: fontFamily,
                ),
              ),

              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.login_screen_title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontFamily: fontFamily),
              ),

              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.login_screen_subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSizeContent, color: Colors.grey[700], fontFamily: fontFamily),
              ),

              const SizedBox(height: 28),

              CommonTextInputWidget(
                text: AppLocalizations.of(context)!.login_screen_email_hint,
                label: AppLocalizations.of(context)!.login_screen_email_label,
                onChanged: (value) {
                  context.read<AuthProvider>().setEmail(value);
                },
                textStyle: TextStyle(fontSize: 14, fontFamily: fontFamily),
                status: false,
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),

              CommonTextInputWidget(
                text: AppLocalizations.of(context)!.login_screen_password_hint,
                label: AppLocalizations.of(context)!.login_screen_password_label,
                onChanged: (value) {
                  context.read<AuthProvider>().setPassword(value);
                },
                textStyle: TextStyle(fontSize: 14, fontFamily: fontFamily),
                status: true,
                prefixIcon: Icons.lock_outline,
                suffixWidget: Icon(Icons.visibility_outlined, color: Colors.grey[600]),
              ),

              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  AppLocalizations.of(context)!.login_screen_forgot_password,
                  style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor, fontFamily: fontFamily),
                ),
              ),

              const SizedBox(height: 18),

              Consumer<AuthProvider>(
                builder: (context, auth, child) {
                  if (auth.user != null &&
                      auth.user!.accessToken.isNotEmpty &&
                      auth.user!.userId.isNotEmpty) {
                    Future.microtask(() {
                      Navigator.pushReplacementNamed(context, '/main');
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
                    text: auth.isLoading ? 'Loading...' : AppLocalizations.of(context)!.login_screen_button,
                    onPressed: auth.isLoading ? null : () => context.read<AuthProvider>().loginProvider(),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    buttonStyle: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0A66FF)),
                  );
                },
              ),

              const SizedBox(height: 12),
              TextButton(
                onPressed: () async {
                  final splashRepo = SplashRepository(SplashData());
                  await splashRepo.setSeenIntro(false);
                },
                child: const Text('setting up intro screen', style: TextStyle(color: Color(0xFF0A66FF))),
              ),

              const SizedBox(height: 20),
              Row(children: [Expanded(child: Divider()), SizedBox(width: 8), Text(AppLocalizations.of(context)!.login_screen_or_continue), SizedBox(width: 8), Expanded(child: Divider())]),
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.g_translate, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        AppLocalizations.of(context)!.login_screen_google_login,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.login_screen_no_account,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: fontFamily,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    AppLocalizations.of(context)!.login_screen_register_now,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: fontFamily,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
