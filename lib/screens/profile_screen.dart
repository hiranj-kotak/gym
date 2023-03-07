//packages
import 'package:flutter/material.dart';
//screens
//widgets

//providers
// ignore: use_key_in_widget_constructors
class ProfileScreen extends StatelessWidget {
  static const route = '/profileScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("initial App"),
      ),
      body: const Center(
        child: Text("profile-page"),
      ),
    );
  }
}
