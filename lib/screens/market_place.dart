//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//screens
//widgets
//providers
import '../providers/gym_data_provider.dart';

// ignore: use_key_in_widget_constructors
class MarketScreen extends StatelessWidget {
  static const route = '/market_place';
  @override
  Widget build(BuildContext context) {
    final gym = Provider.of<GymDataProvider>(context);
    final gymData = gym.items;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("initial App"),
      ),
      body: ListView.builder(
          itemCount: gymData.length,
          itemBuilder: (ctx, i) {
            return Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black45))),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      gymData[i].imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(gymData[i].titleTxt, style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(gymData[i].perNight.toString()),
                    ],
                  ))
                ],
              ),
            );
          }),
    );
  }
}
