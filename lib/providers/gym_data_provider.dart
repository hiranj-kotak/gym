//packages
import 'package:flutter/material.dart';
//screens
//widgets
//providers
import './gym_data.dart';
import './favs_list.dart';

class GymDataProvider with ChangeNotifier {
  bool isfavSelected = false;
  List<GymListData> _items = <GymListData>[
    GymListData(
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/gymeverywhere-d0d6d.appspot.com/o/gym_owner%2Fxyz%2FScreenshot%202023-01-29%20215218.png?alt=media&token=108281e7-79b1-45b7-91b5-eba44d5f18ff',
      titleTxt: 'SFW The GYM(Nadiad)',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 80,
      rating: 4.0,
      perNight: 180,
    ),
    GymListData(
      imagePath:
          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
      titleTxt: 'The Challenger gym',
      subTxt: 'Wembley, London',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: 200,
    ),
    GymListData(
      imagePath:
          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
      titleTxt: 'The muscle factory gym',
      subTxt: 'Wembley, London',
      dist: 3.0,
      reviews: 62,
      rating: 5.0,
      perNight: 60,
    ),
    GymListData(
      imagePath:
          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
      titleTxt: 'Wellocity Prime Gym',
      subTxt: 'Wembley, London',
      dist: 7.0,
      reviews: 90,
      rating: 3.4,
      perNight: 170,
    ),
    GymListData(
      imagePath:
          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
      titleTxt: 'New Fitness Point',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 240,
      rating: 2.5,
      perNight: 200,
    ),
  ];
  List<GymListData> filtered = [];
  bool isfilterd = false;
  List<GymListData> get items {
    if (isfavSelected) {
      return favs;
    }
    if (isfilterd) return [...filtered];
    return [..._items];
  }

  GymListData findById(String id) {
    return _items.firstWhere((gym) => gym.titleTxt == id);
  }

  void filterList(String filter) {
    filtered = _items
        .where((term) =>
            term.titleTxt.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    isfilterd = true;
    notifyListeners();
  }

  void ToggleFav() {
    isfavSelected = !isfavSelected;
    notifyListeners();
  }

  void Notifier() {
    notifyListeners();
  }
}
