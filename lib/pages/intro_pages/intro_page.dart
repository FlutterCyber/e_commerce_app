import 'package:e_commerce_app/pages/intro_pages/into_page_strings.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../bottom_nav_bar.dart';
import 'intro_screen.dart';

class IntroPage extends StatefulWidget {
  static const String id = "intro_page";

  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: PageView(
              controller: _pageController,
              children: [
                InroScreen(
                  myTitle: myTitle1,
                  myContext: myContext1,
                  imagePath: 'assets/images/image1.png',
                ),
                InroScreen(
                  myTitle: myTitle2,
                  myContext: myContext2,
                  imagePath: 'assets/images/image2.png',
                ),
                InroScreen(
                  myTitle: myTitle3,
                  myContext: myContext3,
                  imagePath: 'assets/images/image3.png',
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: const WormEffect(
              dotHeight: 12,
              dotWidth: 12,
              type: WormType.thinUnderground,
            ),
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, BottomNavBar.id);
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 60,
                color: Colors.orange,
                child: const Center(
                  child: Text(
                    "START SHOPPING",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
