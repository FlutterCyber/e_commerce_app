import 'package:e_commerce_app/pages/bottom_nav_bar.dart';
import 'package:e_commerce_app/pages/card_page.dart';
import 'package:e_commerce_app/pages/home_page.dart';
import 'package:e_commerce_app/pages/intro_pages/intro_page.dart';
import 'package:e_commerce_app/pages/messages_page.dart';
import 'package:e_commerce_app/pages/profile_page.dart';
import 'package:e_commerce_app/pages/search_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home:  IntroPage(),
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
