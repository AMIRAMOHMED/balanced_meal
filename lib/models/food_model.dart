import 'package:flutter/material.dart';

class FoodModel  with ChangeNotifier{
  FoodModel( {
    required this.foodName,
    required this.imageUrl,
    required this.categoryName,
    required this.calories,
    required this.id,
    required this.price
  });

  final int calories;
  final double price;
  final String categoryName;
  final String foodName;
  final String imageUrl, id;
}
