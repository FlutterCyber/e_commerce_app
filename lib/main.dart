import 'package:e_commerce_app/pages/bottom_nav_bar.dart';
import 'package:e_commerce_app/pages/card_page.dart';
import 'package:e_commerce_app/pages/home_page.dart';
import 'package:e_commerce_app/pages/intro_pages/intro_page.dart';
import 'package:e_commerce_app/pages/messages_page.dart';
import 'package:e_commerce_app/pages/profile_page.dart';
import 'package:e_commerce_app/pages/search_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('uz', 'UZ'),
          Locale('ru', 'RU')
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const IntroPage(),
      routes: {
        BottomNavBar.id: (context) => const BottomNavBar(),
        CardPage.id: (context) => const CardPage(),
        MessagesPage.id: (context) => const MessagesPage(),
        ProfilePage.id: (context) => const ProfilePage(),
        SearchPage.id: (context) => const SearchPage(),
        HomePage.id: (context) => const HomePage(),
        IntroPage.id: (context) => const IntroPage(),
      },
    );
  }
}
