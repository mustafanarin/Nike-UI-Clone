import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/feature/home/home_view.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';

class BottomNavExample extends StatefulWidget {
  const BottomNavExample({super.key});

  @override
  _BottomNavExampleState createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int _bottomNavIndex = 0;
  int _currentIndex = 0;

  final List<IconData> iconList = [
    Icons.home_outlined,
    Icons.favorite_border,
    Icons.notifications_none,
    Icons.person_outline,
  ];

  // Sayfalar
  final List<Widget> _pages = [
    const HomeView(),
    Container(color: Colors.amber),
    Container(color: Colors.amber),
    Container(color: Colors.amber),
    Container(color: Colors.amber),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButton: SizedBox(
        height: 65.h,
        width: 65.w,
        child: FloatingActionButton(
          backgroundColor: ProjectColors.brandeisBlue,
          onPressed: () {
            setState(() {
              _currentIndex = 2; // CartPage
            });
          },
          elevation: 8,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.shopping_basket_outlined,
            color: ProjectColors.white,
            size: 30,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;

            if (index == 0) {
              _currentIndex = 0; // Home
            } else if (index == 1) {
              _currentIndex = 1; // Favorite
            } else if (index == 2) {
              _currentIndex = 3; // Notifications
            } else if (index == 3) {
              _currentIndex = 4; // Profile
            }
          });
        },
        activeColor: ProjectColors.brandeisBlue,
        inactiveColor: ProjectColors.auroMetal.withOpacity(0.8),
        backgroundColor: ProjectColors.white,
        height: 80.h,
        iconSize: 28,
        splashRadius: 20,
        gapWidth: 100.w,
      ),
    );
  }
}
