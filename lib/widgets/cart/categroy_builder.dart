import 'package:balanced_meal/provider/food_provider.dart';
import 'package:balanced_meal/widgets/cart/cart_food_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatergoryBulider extends StatefulWidget {
  final String ctgName;

  const CatergoryBulider({
    Key? key,
    required this.ctgName,
  }) : super(key: key);

  @override
  State<CatergoryBulider> createState() => CatergoryBuliderState();
}

class CatergoryBuliderState extends State<CatergoryBulider> {
  @override
  Widget build(BuildContext context) {
    final foodProvider = Provider.of<FoodProvider>(context);
    final foods = foodProvider.findFoodByCategroy(ctgName: widget.ctgName);

    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foods.length,
        itemBuilder: (BuildContext context, int index) {
          return FoodCartWidget(
            ctgName: widget.ctgName,
            food: foods[index],
          );
        },
      ),
    );
  }
}
