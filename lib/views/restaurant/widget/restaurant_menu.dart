import 'package:flutter/material.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/models/foods_model.dart';
import 'package:foodly/views/home/widgets/food_tile.dart';

class RestaurantMenuWidget extends StatelessWidget {
  const RestaurantMenuWidget({super.key});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightWhite,
      body: Container(
        height: height * 0.7,
        child: ListView(
          children: List.generate(foods.length, (index) {
            final FoodsModel food = foods.length[index];
            return FoodTile(food: food);
          }),
        ),
      ),
    );
  }
}
