import 'package:balanced_meal/models/cart_model.dart';
import 'package:balanced_meal/models/food_model.dart';
import 'package:balanced_meal/provider/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> cartItems = {};

  bool isFoodInCart({required String productID}) {
    return cartItems.containsKey(productID);
  }

  Map<String, CartModel> get getCartItems {
    return cartItems;
  }

  void addFoodToCart({required String productID}) {
    cartItems.putIfAbsent(
        productID,
        () =>
            CartModel(cartId: const Uuid().v4(), productId: productID, quantity: 1));
    notifyListeners();
  }

  void incrementQuantity({required String productID}) {
    cartItems.update(
        productID,
        (item) => CartModel(
            cartId: item.cartId,
            productId: productID,
            quantity: item.quantity + 1));
    notifyListeners();
  }

  void decrementQuantity({required String productID}) {
    cartItems.update(
        productID,
        (item) => CartModel(
            cartId: item.cartId,
            productId: productID,
            quantity: item.quantity - 1));
    notifyListeners();
  }

  void removeFoodItem({required String productID}) {
    cartItems.remove(productID);

    notifyListeners();
  }

  double getTotalPrice({required FoodProvider foodProvider}) {
    double total = 0.0;
    cartItems.forEach((key, value) {
      final FoodModel? getCurruntFood =
          foodProvider.findFoodById(value.productId);
      if (getCurruntFood == null) {
        total += 0;
      } else {
        total += (getCurruntFood.price) * value.quantity;
      }
    });
    ChangeNotifier();

    return total;
  }

   double getTotalCal({required FoodProvider foodProvider}) {
    double total = 0.0;
    cartItems.forEach((key, value) {
      final FoodModel? getCurruntFood =
          foodProvider.findFoodById(value.productId);
      if (getCurruntFood == null) {
        total += 0;
      } else {
        total += (getCurruntFood.calories) * value.quantity;
      }
    });
    ChangeNotifier();

    return total;
  }
}
