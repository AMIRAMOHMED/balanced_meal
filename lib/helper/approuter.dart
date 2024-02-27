import 'package:flutter/material.dart';
import 'package:balanced_meal/Screens/creat_your_order_screen.dart';
import 'package:balanced_meal/Screens/details_screen.dart';
import 'package:balanced_meal/Screens/order_screen.dart';
import 'package:balanced_meal/Screens/welcome_screen.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());
      case 'detailsScreen':
        return MaterialPageRoute(builder: (context) => const DetailsScreen());
      case 'creatYourOrderScreen':
        return MaterialPageRoute(builder: (context) => const CreatYourOrderScreen());
      case 'orderScreen':
        return MaterialPageRoute(builder: (context) => const OrderScreen());
    }

    return null;
  }
}
