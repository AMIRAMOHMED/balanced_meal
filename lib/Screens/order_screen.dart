import 'package:balanced_meal/widgets/cart/bottomsheet/bottom_sheet_order.dart';
import 'package:balanced_meal/widgets/cart/builder_summary_cart.dart';
import 'package:balanced_meal/widgets/screen/appbar_widget.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(text: "Create your Food"),
      body: Column(
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                child: Column(
                  children: [
                    BuildSummaryCart(),
                  ],
                ),
              ),
            ),
          ),
          BottomSheetOrder(
              text: 'Confirm',
              fun: () {
    Navigator.pushReplacementNamed(context, '/');
              })
        ],
      ),
    );
  }
}
