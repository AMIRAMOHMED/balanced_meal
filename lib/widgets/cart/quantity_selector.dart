// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:balanced_meal/provider/cart_provider.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    Key? key,
    required this.foodId,
  }) : super(key: key);

  final String foodId;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (cartProvider.cartItems[foodId]!.quantity == 1) {
              cartProvider.removeFoodItem(productID: foodId);
            } else {
              cartProvider.decrementQuantity(productID: foodId);
            }
          },
          icon: const Icon(Icons.remove),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(
              const Color(0xFFFA6400),
            ),
          ),
        ),
        Text(
          "${cartProvider.cartItems[foodId]?.quantity ?? 0}",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        IconButton(
          onPressed: () {
            cartProvider.incrementQuantity(productID: foodId);
          },
          icon: const Icon(Icons.add),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(
              const Color(0xFFFA6400),
            ),
          ),
        ),
      ],
    );
  }
}
