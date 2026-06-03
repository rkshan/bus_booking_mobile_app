import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/auth/auth_provider.dart';
import '../../../core/localization/l10n/app_localizations.dart';
import '../../../core/localization/language_controller.dart';
import '../presentation/home_widget/common_button_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 80, color: Colors.blue),

            const SizedBox(height: 20),

            const Text(
              'Welcome to Home Screen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              'You are successfully logged in',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            /// 🔐 Logout
            CommonButtonWidget(
              text: "Logout",
              onPressed: () async {
                await context.read<AuthProvider>().logoutProvider();

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            /// 🌐 Language Switcher
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
      ),
    );
  }
}