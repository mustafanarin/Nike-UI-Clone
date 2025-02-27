import 'package:flutter/material.dart';
import 'package:nike_ui_clone/feature/welcome/onboard_first_view.dart';
import 'package:nike_ui_clone/feature/welcome/onboard_second_view.dart';
import 'package:nike_ui_clone/feature/welcome/onboard_third_view.dart';

final class Onboardings extends StatefulWidget {
  const Onboardings({super.key});

  @override
  _OnboardingsState createState() => _OnboardingsState();
}

class _OnboardingsState extends State<Onboardings> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView for pages
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: const [
              OnboardFirstView(),
              OnboardSecondView(),
              OnboardThirdView(),
            ],
          ),

          // Page indicators
          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildIndicator(0),
                const SizedBox(width: 8),
                buildIndicator(1),
                const SizedBox(width: 8),
                buildIndicator(2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator(int pageIndex) {
    return Container(
      width: _currentPage == pageIndex ? 40 : 30,
      height: 3,
      decoration: BoxDecoration(
        color: _currentPage == pageIndex ? Colors.white : Colors.orange,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
