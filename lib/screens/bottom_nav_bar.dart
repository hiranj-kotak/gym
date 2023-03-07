//packages
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//screens
import 'searchScreen.dart';
import './home_screen.dart';
import './market_place.dart';
import './profile_screen.dart';

//widgets
//providers

class BottomNavBar extends StatefulWidget {
  static const route = '/';
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  int index = 0;
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(),
      SearchScreen(),
      // SearchScreen(),
      MarketScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            Icons.home_outlined,
          ),
          Icon(
            Icons.search_outlined,
          ),
          Icon(
            Icons.shopping_basket_outlined,
          ),
          Icon(
            Icons.person_2_outlined,
          ),
        ],
        index: index,
        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
