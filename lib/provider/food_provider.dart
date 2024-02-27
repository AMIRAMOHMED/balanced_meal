import 'package:balanced_meal/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class FoodProvider with ChangeNotifier {
  List<FoodModel> allFood = [
    FoodModel(
      id: const Uuid().v4(),
      price: 2,
      foodName: 'Broccoli',
      imageUrl:
          'https://cdn.britannica.com/25/78225-050-1781F6B7/broccoli-florets.jpg',
      categoryName: 'Vegetables',
      calories: 55,
    ),
    FoodModel(
      id: const Uuid().v4(),
      price: 2,
      foodName: 'Spinach',
      imageUrl:
          'https://www.daysoftheyear.com/cdn-cgi/image/dpr=1%2Cf=auto%2Cfit=cover%2Cheight=650%2Cq=40%2Csharpen=1%2Cwidth=956/wp-content/uploads/fresh-spinach-day.jpg',
      categoryName: 'Vegetables',
      calories: 23,
    ),
    FoodModel(
      id: const Uuid().v4(),
      foodName: 'Carrot',
      price: 1,
      imageUrl:
          'https://cdn11.bigcommerce.com/s-kc25pb94dz/images/stencil/1280x1280/products/271/762/Carrot__40927.1634584458.jpg?c=2',
      categoryName: 'Vegetables',
      calories: 41,
    ),
    FoodModel(
      id: const Uuid().v4(),
      foodName: 'Bell Pepper',
      price: 1,
      imageUrl:
          'https://i5.walmartimages.com/asr/5d3ca3f5-69fa-436a-8a73-ac05713d3c2c.7b334b05a184b1eafbda57c08c6b8ccf.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF',
      categoryName: 'Vegetables',
      calories: 31,
    ),
    FoodModel(
      id: const Uuid().v4(),
      price: 3,
      foodName: 'Brown Rice',
      imageUrl: 'https://assets-jpcust.jwpsrv.com/thumbnails/k98gi2ri-720.jpg',
      categoryName: 'Grains',
      calories: 111,
    ),
    FoodModel(
      id: const Uuid().v4(),
      price: 3,
      foodName: 'Oats',
      imageUrl:
          'https://media.post.rvohealth.io/wp-content/uploads/2020/03/oats-oatmeal-732x549-thumbnail.jpg',
      categoryName: 'Grains',
      calories: 389,
    ),
    FoodModel(
      id: const Uuid().v4(),
      foodName: 'Sweet Corn',
      price: 1.5,
      imageUrl:
          'https://m.media-amazon.com/images/I/41F62-VbHSL._AC_UF1000,1000_QL80_.jpg',
      categoryName: 'Grains',
      calories: 86,
    ),
    FoodModel(
      id: const Uuid().v4(),
      foodName: 'Chicken',
      price: 6.5,
      imageUrl:
          "https://www.vhv.rs/dpng/f/556-5560823_grilled-chicken-breast-png-transparent-png.png",
      categoryName: 'Meats',
      calories: 165,
    ),
    
    FoodModel(
      price: 8,
      id: const Uuid().v4(),
      foodName: 'Lean Beef',
      imageUrl:
          'https://www.mashed.com/img/gallery/the-truth-about-lean-beef/l-intro-1621886574.jpg',
      categoryName: 'Meats',
      calories: 250,
    ),
    FoodModel(
      id: const Uuid().v4(),
      foodName: 'Turkey',
      price: 9,
      imageUrl:
          'https://fox59.com/wp-content/uploads/sites/21/2022/11/white-meat.jpg?w=2560&h=1440&crop=1',
      categoryName: 'Meats',
      calories: 135,
    ),
  ];

  List<FoodModel> get getFoods => allFood;

  FoodModel? findFoodById(String foodId) {
    return allFood.firstWhere((element) => element.id == foodId);
  }

  List<FoodModel> findFoodByCategroy({required String ctgName}) {
    List<FoodModel> ctgList = allFood
        .where((element) =>
            element.categoryName.toLowerCase().contains(ctgName.toLowerCase()))
        .toList();
    return ctgList;
  }
}
