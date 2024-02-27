import 'package:balanced_meal/models/cart_model.dart';
import 'package:balanced_meal/provider/food_provider.dart';
import 'package:balanced_meal/widgets/cart/quantity_selector.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderSummarycart extends StatelessWidget {
  const OrderSummarycart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartModelProvider = Provider.of<CartModel>(context);
    final foodProvider = Provider.of<FoodProvider>(context);
    final getCurrentFood =
        foodProvider.findFoodById(cartModelProvider.productId);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Card(
        child: Container(
          width: 340,
          height: 78,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
            children: [
              FancyShimmerImage(
                imageUrl: getCurrentFood!.imageUrl,
                width: 60,
                height: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            getCurrentFood.foodName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child: Text(
                            " \$ ${getCurrentFood.price} ",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                     const SizedBox(
                height: 7,
              ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 160,
                          child: Text(
                            "${getCurrentFood.calories}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        QuantitySelector(foodId: getCurrentFood.id),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
