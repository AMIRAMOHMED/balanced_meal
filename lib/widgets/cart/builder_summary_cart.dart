import 'package:balanced_meal/provider/cart_provider.dart';
import 'package:balanced_meal/widgets/cart/summary_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildSummaryCart extends StatelessWidget {

  const BuildSummaryCart({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final cartModelProvider = Provider.of<CartProvider>(context);
    return SizedBox(
      width: 350,
      height: 900,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: cartModelProvider.getCartItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ChangeNotifierProvider.value(
              value: cartModelProvider.getCartItems.values.toList()[index],
              child: const OrderSummarycart());
        },
      ),
    );
  }
}
