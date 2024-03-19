import 'package:flutter/material.dart';
import 'package:foodly/models/restaurants_model.dart';

class fetchRestaurant {
  final RestaurantsModel? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  fetchRestaurant({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}
