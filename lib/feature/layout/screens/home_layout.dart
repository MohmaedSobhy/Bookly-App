import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/feature/cart/screens/cart_screen.dart';
import 'package:books_app/feature/search/screens/search_screen.dart';
import 'package:books_app/feature/setting/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import '../../Home/screens/home_scrreen.dart';
import '../../wish list/screen/wish_list_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const WishListScreen(),
    const CartScreen(),
    const SettingScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedItemColor: AppColor.darkBlue,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: AppColor.mainColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Books',
              backgroundColor: AppColor.mainColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'WishList',
              backgroundColor: AppColor.mainColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
              backgroundColor: AppColor.mainColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: AppColor.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
