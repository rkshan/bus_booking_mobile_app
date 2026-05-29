import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/localization/language_controller.dart';
import 'routes/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import "../../../core/localization/l10n/app_localizations.dart";
import 'package:google_fonts/google_fonts.dart';
import 'features/login/auth_data.dart';
import 'features/login/auth_repository.dart';
import 'features/login/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              LanguageController()..loadSavedLanguage(),
        ),

        ChangeNotifierProvider(
          create: (_) => AuthProvider(
            AuthRepository(
              AuthData(),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageController>(
      builder: (context, lang, child) {
        return MaterialApp(
          locale: lang.currentLocale,

          theme: ThemeData(
            textTheme: GoogleFonts.notoSansTextTheme(),
          ),

          supportedLocales: const [
            Locale('en'),
            Locale('si'),
            Locale('ta'),
          ],

          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          initialRoute: '/',
          routes: AppRoutes.routes,
        );
      },
    );
  }
}