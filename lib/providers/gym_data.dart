//packages
import 'package:flutter/material.dart';
//screens
//widgets
//providers
import './gym_data_provider.dart';
import './favs_list.dart';

class GymListData with ChangeNotifier {
  GymListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 180,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int perNight;
  bool isFav = false;

  void toggleFavorite() {
    isFav = !isFav;
    if (isFav)
      addFav(this);
    else
      removeFav(this);
    notifyListeners();
  }
}
