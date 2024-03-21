import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly/common/custom_button.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/models/restaurants_model.dart';
import 'package:foodly/views/restaurant/rating_page.dart';
import 'package:get/get.dart';

class RestaurantBottomBar extends StatelessWidget {
  const RestaurantBottomBar({
    super.key,
    required this.restaurant,
  });

  final RestaurantsModel? restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      RatingBarIndicator(
        itemCount: 5,
        itemSize: 25,
        rating: restaurant!.rating.toDouble(),
        itemBuilder: (context, i) => const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      ),
      CustomButton(
        onTap: () {
          Get.to(() => const RatingPage());
        },
        btnWidth: width / 3,
        text: "Rate Restaurant",
      )
    ]);
  }
}
