//packages
import 'package:flutter/material.dart';
//screens
//widgets

//providers
// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  static const route = '/homescreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "initial App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Center(
        child: Text("Home-page"),
      ),
    );
  }
}
