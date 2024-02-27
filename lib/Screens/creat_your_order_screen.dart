import 'package:balanced_meal/provider/cart_provider.dart';
import 'package:balanced_meal/provider/food_provider.dart';
import 'package:balanced_meal/widgets/screen/appbar_widget.dart';
import 'package:balanced_meal/widgets/cart/bottomsheet/bottom_sheet_order.dart';
import 'package:balanced_meal/widgets/cart/categroy_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatYourOrderScreen extends StatelessWidget {
  const CreatYourOrderScreen({Key? key}) : super(key: key);

  Widget _labelText(String text) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final foodProvider = Provider.of<FoodProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: const AppBarWidget(text: "Create your Food"),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 25, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _labelText("Vegetables"),
                  const CatergoryBulider(ctgName: "Vegetables"),
                  _labelText("Meats"),
                  const CatergoryBulider(ctgName: "Meats"),
                  _labelText("Grains"),
                  const CatergoryBulider(ctgName: "Grains"),
                ],
              ),
            ),
          ),
        ),
         BottomSheetOrder(
          text: 'Place Order',
         fun: ()
         { if (cartProvider.getTotalCal(foodProvider: foodProvider) != 0) {
                Navigator.pushNamed(context, 'orderScreen');
              }}
        ),
      ]),
    );
  }
}
