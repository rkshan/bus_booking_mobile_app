import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_si.dart';
import 'app_localizations_ta.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('si'),
    Locale('ta'),
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @intro.
  ///
  /// In en, this message translates to:
  /// **'Introduction'**
  String get intro;

  /// No description provided for @langEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get langEnglish;

  /// No description provided for @langSinhala.
  ///
  /// In en, this message translates to:
  /// **'සිංහල'**
  String get langSinhala;

  /// No description provided for @langTamil.
  ///
  /// In en, this message translates to:
  /// **'தமிழ்'**
  String get langTamil;

  /// No description provided for @page1_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to QuickBus'**
  String get page1_welcome;

  /// No description provided for @page1_title.
  ///
  /// In en, this message translates to:
  /// **'Travel Made Simple'**
  String get page1_title;

  /// No description provided for @page1_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Book your bus tickets online easily, securely, and comfortably.'**
  String get page1_subtitle;

  /// No description provided for @page1_highlight1.
  ///
  /// In en, this message translates to:
  /// **'Easy Online Booking'**
  String get page1_highlight1;

  /// No description provided for @page1_highlight2.
  ///
  /// In en, this message translates to:
  /// **'Travel Across Sri Lanka'**
  String get page1_highlight2;

  /// No description provided for @page1_highlight3.
  ///
  /// In en, this message translates to:
  /// **'Safe & Secure Payments'**
  String get page1_highlight3;

  /// No description provided for @page2_welcome.
  ///
  /// In en, this message translates to:
  /// **'Why Choose QuickBus?'**
  String get page2_welcome;

  /// No description provided for @page2_title.
  ///
  /// In en, this message translates to:
  /// **'Everything You Need'**
  String get page2_title;

  /// No description provided for @page2_feature1.
  ///
  /// In en, this message translates to:
  /// **'Easy ticket booking'**
  String get page2_feature1;

  /// No description provided for @page2_feature2.
  ///
  /// In en, this message translates to:
  /// **'Choose your favorite seat'**
  String get page2_feature2;

  /// No description provided for @page2_feature3.
  ///
  /// In en, this message translates to:
  /// **'Secure online payments'**
  String get page2_feature3;

  /// No description provided for @page2_feature4.
  ///
  /// In en, this message translates to:
  /// **'Instant booking confirmation'**
  String get page2_feature4;

  /// No description provided for @page3_welcome.
  ///
  /// In en, this message translates to:
  /// **'Get Started Today'**
  String get page3_welcome;

  /// No description provided for @page3_title.
  ///
  /// In en, this message translates to:
  /// **'Book in 3 Simple Steps'**
  String get page3_title;

  /// No description provided for @page3_step1.
  ///
  /// In en, this message translates to:
  /// **'Search your route'**
  String get page3_step1;

  /// No description provided for @page3_step2.
  ///
  /// In en, this message translates to:
  /// **'Select your seat'**
  String get page3_step2;

  /// No description provided for @page3_step3.
  ///
  /// In en, this message translates to:
  /// **'Pay and travel'**
  String get page3_step3;

  /// No description provided for @page3_button.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get page3_button;

  /// No description provided for @login_screen_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get login_screen_welcome;

  /// No description provided for @login_screen_title.
  ///
  /// In en, this message translates to:
  /// **'Login to Your Account'**
  String get login_screen_title;

  /// No description provided for @login_screen_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue your journey with QuickBus.'**
  String get login_screen_subtitle;

  /// No description provided for @login_screen_email_label.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get login_screen_email_label;

  /// No description provided for @login_screen_email_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get login_screen_email_hint;

  /// No description provided for @login_screen_password_label.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get login_screen_password_label;

  /// No description provided for @login_screen_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get login_screen_password_hint;

  /// No description provided for @login_screen_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get login_screen_forgot_password;

  /// No description provided for @login_screen_button.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login_screen_button;

  /// No description provided for @login_screen_no_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get login_screen_no_account;

  /// No description provided for @login_screen_register_now.
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get login_screen_register_now;

  /// No description provided for @login_screen_or_continue.
  ///
  /// In en, this message translates to:
  /// **'Or continue with'**
  String get login_screen_or_continue;

  /// No description provided for @login_screen_google_login.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get login_screen_google_login;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'si', 'ta'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'si':
      return AppLocalizationsSi();
    case 'ta':
      return AppLocalizationsTa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
