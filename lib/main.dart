import 'package:balanced_meal/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:balanced_meal/helper/approuter.dart';
import 'package:balanced_meal/provider/cart_provider.dart';
import 'package:balanced_meal/provider/food_provider.dart';

void main() {
  runApp(const BalancedMeal());
}

class BalancedMeal extends StatelessWidget {
  const BalancedMeal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FoodProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),

        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          
        ),
      ],
      child: Consumer3<FoodProvider, CartProvider,UserProvider>(
        builder: (context, foodProvider, cartProvider, userProvider,child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Balanced Meal',
            onGenerateRoute: appRouter.generateRoute,
          );
        },
      ),
    );
  }
}
