import 'package:flutter/material.dart';
import '../../../core/localization/language_controller.dart';
import 'package:provider/provider.dart';
import "../../../core/localization/l10n/app_localizations.dart";
import 'introduction_widget/intro_1_widget.dart';
import 'introduction_widget/intro_2_widget.dart';
import 'introduction_widget/intro_3_widget.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final langCode = context
        .watch<LanguageController>()
        .currentLocale
        .languageCode;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          AppLocalizations.of(context)!.intro,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF7E8B97),
            fontFamily: langCode == 'si'
                ? 'NotoSansSinhala'
                : langCode == 'ta'
                    ? 'NotoSansTamil'
                    : null,
          ),
        ),
      ),

      body: Column(
        children: [
          // page view
          Expanded(
            child: PageView(
              controller: _controller,

              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },

              children: [

                // page 1 - language selection
                const LanguageSelectorWidget(),

                // page 2 - intro text
                const Intro2Page(),

                // page 3 - intro text
                Intro3Page(),
              ],
            ),
          ),

          // dot indicators
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  width: currentPage == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? const Color(0xFF0A66FF)
                        : const Color(0xFFE5E7EB),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}