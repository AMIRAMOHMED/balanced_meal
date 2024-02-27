import 'package:balanced_meal/models/food_model.dart';
import 'package:balanced_meal/provider/cart_provider.dart';
import 'package:balanced_meal/widgets/cart/quantity_selector.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodCartWidget extends StatefulWidget {
  FoodCartWidget({
    Key? key,
    required this.food,
    required String ctgName,
  }) : super(key: key);

  final FoodModel food;

  @override
  State<FoodCartWidget> createState() => _FoodCartWidgetState();
}

class _FoodCartWidgetState extends State<FoodCartWidget> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Card(
      child: Container(
        width: 190,
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FancyShimmerImage(
                imageUrl: widget.food.imageUrl,
                width: 163,
                height: 105,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      "${widget.food.foodName}  ",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 66,
                    child: Text(
                      " ${widget.food.calories} cal",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 50,
                    child: Text(
                      " \$ ${widget.food.price} ",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  cartProvider.isFoodInCart(productID: widget.food.id)
                      ? QuantitySelector(
                          foodId: widget.food.id,
                        )
                      : SizedBox(
                          width: 60,
                          height: 33,
                          child: TextButton(
                            onPressed: () {
                              cartProvider.addFoodToCart(
                                  productID: widget.food.id);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFFFA6400),
                              ),
                            ),
                            child: const Text(
                              "Add",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
