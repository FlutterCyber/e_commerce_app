import 'package:e_commerce_app/pages/card_page.dart';
import 'package:e_commerce_app/pages/home_page.dart';
import 'package:e_commerce_app/pages/messages_page.dart';
import 'package:e_commerce_app/pages/profile_page.dart';
import 'package:e_commerce_app/pages/search_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BottomNavBar extends StatefulWidget {
  static const String id = "bottom_nav_bar";

  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          onPageChanged: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          controller: _pageController,
          children: const [
            HomePage(),
            MessagesPage(),
            SearchPage(),
            CardPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(
              () {
                _selectedIndex = index;
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
              },
            );
          },
          items:  [
            BottomNavigationBarItem(icon: Icon(IconlyBold.home), label: "Home".tr()),
            BottomNavigationBarItem(
                icon: Icon(IconlyBold.message), label: "Messages".tr()),
            BottomNavigationBarItem(
                icon: Icon(IconlyBold.search), label: "Search".tr()),
            BottomNavigationBarItem(icon: Icon(IconlyBold.bag), label: "Cart".tr()),
            BottomNavigationBarItem(
                icon: Icon(IconlyBold.profile), label: "Profile".tr()),
          ],
        ),
      ),
    );
  }
}
