import 'package:balanced_meal/provider/cart_provider.dart';
import 'package:balanced_meal/provider/food_provider.dart';
import 'package:balanced_meal/provider/user_provider.dart';
import 'package:balanced_meal/widgets/screen/material_buttom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetOrder extends StatelessWidget {
  const BottomSheetOrder({
    super.key,
    required this.text,
    required this.fun,
  });

  final Function fun;
  final String text;

  Widget _bottomText({
    required String text,
    required FontWeight fontW,
    required double width,
    required double fontS,
    required Color color,
  }) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: fontS, fontWeight: fontW),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final foodProvider = Provider.of<FoodProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Container(
      width: 375,
      height: 164,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 0, 0),
        child: Column(children: [
          Row(
            children: [
              _bottomText(
                text: "Cals",
                fontW: FontWeight.w400,
                width: 130,
                fontS: 16,
                color: Colors.black,
              ),
              Flexible(
                child: _bottomText(
                  text:
                      "${cartProvider.getTotalCal(foodProvider: foodProvider)}Cal Out of ${userProvider.getTotalCal()} Cal",
                  fontW: FontWeight.w400,
                  width: 200,
                  fontS: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              _bottomText(
                text: "Price",
                fontW: FontWeight.w400,
                width: 250,
                fontS: 16,
                color: Colors.black,
              ),
              _bottomText(
                text:
                    "\$ ${cartProvider.getTotalCal(foodProvider: foodProvider)}",
                fontW: FontWeight.w500,
                width: 100,
                fontS: 16,
                color: const Color(0xFFF25700),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButtom(
            text: text,
            colorButtom:
                cartProvider.getTotalCal(foodProvider: foodProvider) == 0
                    ? const Color(0xFFEAECF0)
                    : const Color(0xFFF25700),
            colorText: Colors.white,
            fun: fun,
            paddingHori: 50,
            paddingVer: 10,
            borderRadius: 12,
          )
        ]),
      ),
    );
  }
}
