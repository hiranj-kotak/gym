//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//screens
import './screens/bottom_nav_bar.dart';
import 'screens/gym_detail.dart';

//widgets
//providers
import './providers/gym_data.dart';
import './providers/gym_data_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GymDataProvider>.value(
          value: GymDataProvider(),
        ),
        ChangeNotifierProvider<GymListData>.value(
          value: GymListData(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color.fromRGBO(84, 211, 194, 1),
          appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(84, 211, 194, 1),
          ),
        ),
        title: 'Gym',
        routes: {
          BottomNavBar.route: (context) => BottomNavBar(),
          GymDetail.route: (context) => GymDetail(),
        },
      ),
    );
  }
}
