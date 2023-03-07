import '../app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../providers/gym_data.dart';
import '../screens/gym_detail.dart';

class HotelListView extends StatelessWidget {
  final Function notifier;
  HotelListView({required this.notifier});
  @override
  Widget build(BuildContext context) {
    final gymdata = Provider.of<GymListData>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
      child: InkWell(
        splashColor: Colors.black,
        onTap: () {
          Navigator.of(context).pushNamed(
            GymDetail.route,
            arguments: {
              "gymdata": gymdata,
            },
          );
        },
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  offset: const Offset(4, 4),
                  blurRadius: 16,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.4,
                    child: Image.network(
                      gymdata!.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      color: Colors.transparent.withOpacity(0.7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 8, bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      gymdata!.titleTxt,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          gymdata!.subTxt,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white
                                                  .withOpacity(0.8)),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Row(
                                        children: <Widget>[
                                          RatingBar(
                                            initialRating: gymdata!.rating,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 24,
                                            ratingWidget: RatingWidget(
                                              full: Icon(
                                                Icons.star_rate_rounded,
                                                color: HotelAppTheme
                                                        .buildLightTheme()
                                                    .primaryColor,
                                              ),
                                              half: Icon(
                                                Icons.star_half_rounded,
                                                color: HotelAppTheme
                                                        .buildLightTheme()
                                                    .primaryColor,
                                              ),
                                              empty: Icon(
                                                Icons.star_border_rounded,
                                                color: HotelAppTheme
                                                        .buildLightTheme()
                                                    .primaryColor,
                                              ),
                                            ),
                                            itemPadding: EdgeInsets.zero,
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          Text(
                                            ' ${gymdata!.reviews} Reviews',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white
                                                    .withOpacity(0.8)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, top: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  '\₹${gymdata!.perNight}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: HotelAppTheme.buildLightTheme()
                                        .primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  '/per Day',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white.withOpacity(1)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                        onTap: () {
                          gymdata.toggleFavorite();
                          notifier();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            gymdata.isFav
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: HotelAppTheme.buildLightTheme().primaryColor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
