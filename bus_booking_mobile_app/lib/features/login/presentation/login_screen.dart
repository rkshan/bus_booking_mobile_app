import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../../../core/localization/l10n/app_localizations.dart";
import 'login_widget/common_text_input_widget.dart';
import 'login_widget/common_button_widget.dart';
import '../../../core/auth/auth_provider.dart';
import '../../../core/app/splash_repository.dart';
import '../../../core/app/splash_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  AuthProvider? _authProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final authProvider = Provider.of<AuthProvider>(context);
    if (_authProvider != authProvider) {
      _authProvider?.removeListener(_onAuthChanged);
      _authProvider = authProvider;
      _authProvider?.addListener(_onAuthChanged);
    }
  }

  @override
  void dispose() {
    _authProvider?.removeListener(_onAuthChanged);
    super.dispose();
  }

  void _onAuthChanged() {
    if (!mounted) return;
    final auth = _authProvider;
    if (auth == null) return;

    if (auth.user != null &&
        auth.user!.accessToken.isNotEmpty &&
        auth.user!.userId.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/main');
        }
      });
    }

    if (auth.errorMessage != null) {
      final msg = auth.errorMessage!;
      auth.errorMessage = null; // Clear so it doesn't show again on rebuilds
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(msg),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final langCode = Localizations.localeOf(context).languageCode;
    final fontSizeGreeting = langCode == 'si' || langCode == 'ta' ? 28.0 : 34.0;
    final fontFamily = langCode == 'si'
        ? 'NotoSansSinhala'
        : langCode == 'ta'
            ? 'NotoSansTamil'
            : null;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // very soft, clean background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              
              // "Welcome Back" Header
              Text(
                AppLocalizations.of(context)!.login_screen_welcome,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSizeGreeting,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A), // slate-900
                  fontFamily: fontFamily,
                ),
              ),

              const SizedBox(height: 12),
              
              // "Login to Your Account" Subtitle
              Text(
                AppLocalizations.of(context)!.login_screen_title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0F172A), // slate-900
                  fontFamily: fontFamily,
                ),
              ),

              const SizedBox(height: 6),
              
              // Lighter gray description
              Text(
                AppLocalizations.of(context)!.login_screen_subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xFF64748B), // slate-500
                  fontFamily: fontFamily,
                ),
              ),

              const SizedBox(height: 36),

              // Email Field
              CommonTextInputWidget(
                text: AppLocalizations.of(context)!.login_screen_email_hint,
                label: '', // Empty to hide floating label and use placeholder style like screenshot
                onChanged: (value) {
                  context.read<AuthProvider>().setEmail(value);
                },
                status: false,
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),

              // Password Field
              CommonTextInputWidget(
                text: AppLocalizations.of(context)!.login_screen_password_hint,
                label: '', // Empty to hide floating label and use placeholder style like screenshot
                onChanged: (value) {
                  context.read<AuthProvider>().setPassword(value);
                },
                status: _obscurePassword,
                prefixIcon: Icons.lock_outline,
                suffixWidget: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: const Color(0xFF94A3B8), // slate-400
                    size: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),

              const SizedBox(height: 12),
              
              // Forgot Password link
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Handle forgot password
                  },
                  child: Text(
                    AppLocalizations.of(context)!.login_screen_forgot_password,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF475569), // slate-600
                      fontFamily: fontFamily,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Login Button
              CommonButtonWidget(
                text: auth.isLoading ? 'Loading...' : AppLocalizations.of(context)!.login_screen_button,
                onPressed: auth.isLoading
                    ? null
                    : () => context.read<AuthProvider>().loginProvider(),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                buttonStyle: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A66FF),
                  disabledBackgroundColor: const Color(0xFF0A66FF).withAlpha(150),
                  minimumSize: const Size.fromHeight(56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  elevation: 4,
                  shadowColor: const Color(0xFF0A66FF).withAlpha(100),
                ),
              ),

              const SizedBox(height: 12),
              
              // "setting up intro screen" button
              TextButton(
                onPressed: () async {
                  final splashRepo = SplashRepository(SplashData());
                  await splashRepo.setSeenIntro(false);
                },
                child: Text(
                  'setting up intro screen',
                  style: TextStyle(
                    color: const Color(0xFF0A66FF),
                    fontWeight: FontWeight.w600,
                    fontFamily: fontFamily,
                  ),
                ),
              ),

              const SizedBox(height: 20),
              
              // "Or continue with" Divider
              Row(
                children: [
                  Expanded(child: Divider(color: const Color(0xFFE2E8F0), thickness: 1)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(
                        color: Color(0xFF64748B), // slate-500
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: const Color(0xFFE2E8F0), thickness: 1)),
                ],
              ),
              
              const SizedBox(height: 20),

              // Google Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  onPressed: () {
                    // Google sign-in
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/google.png',
                        width: 22,
                        height: 22,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Google',
                        style: TextStyle(
                          color: Color(0xFF0F172A), // slate-900
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),
              
              // "Don't have an account? Register Now" Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.login_screen_no_account,
                    style: TextStyle(
                      color: const Color(0xFF64748B), // slate-500
                      fontSize: 14,
                      fontFamily: fontFamily,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Register
                    },
                    child: Text(
                      AppLocalizations.of(context)!.login_screen_register_now,
                      style: TextStyle(
                        color: const Color(0xFF0A66FF),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: fontFamily,
                      ),
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
