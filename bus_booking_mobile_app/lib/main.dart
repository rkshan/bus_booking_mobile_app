import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/localization/language_controller.dart';
import 'routes/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import "core/localization/l10n/app_localizations.dart";
import 'package:google_fonts/google_fonts.dart';
import 'core/auth/auth_data.dart';
import 'core/auth/auth_repository.dart';
import 'core/auth/auth_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'features/main/main_screen_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LanguageController()..loadSavedLanguage(),
        ),

        ChangeNotifierProvider(
          create: (_) => AuthProvider(AuthRepository(AuthData())),
        ),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
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

          theme: ThemeData(textTheme: GoogleFonts.notoSansTextTheme()),

          supportedLocales: const [Locale('en'), Locale('si'), Locale('ta')],

          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          initialRoute: '/',
          routes: AppRoutes.routes,

          builder: (context, child) {
            return Stack(
              children: [
                child!,

                if (lang.isLoading)
                  Container(
                    color: Colors.black54,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}