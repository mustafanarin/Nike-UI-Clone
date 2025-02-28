import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/feature/cart/my_cart_view.dart';
import 'package:nike_ui_clone/feature/favorite/favorite_view.dart';
import 'package:nike_ui_clone/feature/home/home_view.dart';
import 'package:nike_ui_clone/feature/notification/notification_view.dart';
import 'package:nike_ui_clone/feature/profile/profile_view.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';

final class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _bottomNavIndex = 0;
  int _currentIndex = 0;

  final List<IconData> iconList = [
    Icons.home_outlined,
    Icons.favorite_border,
    Icons.notifications_none,
    Icons.person_outline,
  ];

  final List<Widget> _pages = [
    const HomeView(),
    const FavoriteView(),
    CartView(),
    NotificationView(),
    const ProfileView(),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartView()),
            );
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileView()),
              ); // Profile
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
