import 'package:flutter/material.dart';
import '../main_screen_provider.dart';
import '../../home/presentation/home_widget.dart';
import '../../tickets/presentation/ticket_widget.dart';
import '../../profile/presentation/profile_widget.dart';
import "../../../core/localization/l10n/app_localizations.dart";
import '../../../core/localization/language_controller.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final langCode = Localizations.localeOf(context).languageCode;
    final fontSizelabelSelected = langCode == 'si'
        ? 17.0
        : langCode == 'ta'
        ? 17.0
        : 17.0;
    final fontSizelabelUnselected = langCode == 'si'
        ? 15.0
        : langCode == 'ta'
        ? 15.0
        : 15.0;
    final fontSizeContent = langCode == 'si'
        ? 16.0
        : langCode == 'ta'
        ? 16.0
        : 16.0;
    final fontFamily = langCode == 'si'
        ? 'NotoSansSinhala'
        : langCode == 'ta'
        ? 'NotoSansTamil'
        : null;
    final navProvider = context.watch<NavigationProvider>();
    final pages = const [
      HomeWidget(),
      TicketWidget(),
      ProfileWidget(),
    ];
    return Scaffold(
       body: IndexedStack(
        index: navProvider.currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navProvider.currentIndex,
        onTap: (index) {
          context.read<NavigationProvider>().setIndex(index);
        },
        selectedLabelStyle: TextStyle(
          fontSize:   fontSizelabelSelected,
          fontFamily: fontFamily,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: fontSizelabelUnselected,
          fontFamily: fontFamily,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: AppLocalizations.of(context)!.main_screen_menu_home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number_outlined),
            label: AppLocalizations.of(context)!.main_screen_menu_my_tickets,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppLocalizations.of(context)!.main_screen_menu_profile,
          ),
        ],
      ),
    );
  }
}