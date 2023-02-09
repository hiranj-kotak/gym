import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatelessWidget {
  static const route = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("initial App"),
      ),
      body: const Center(
        child: Text("hello"),
      ),
      bottomNavigationBar: const BottomNavBarCurvedFb1(),
    );
  }
}
