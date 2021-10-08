import 'package:flutter/material.dart';
import 'package:dicoding_food/model/food.dart';
import 'package:dicoding_food/thumbnail/food_thumb.dart';



class CategoryFoodLayout extends StatefulWidget {
  static const routeName = '/category-food';
  final List<Food> availableFood;
  CategoryFoodLayout(this.availableFood);
  @override
  _CategoryFoodLayoutState createState() => _CategoryFoodLayoutState();
}

class _CategoryFoodLayoutState extends State<CategoryFoodLayout> {
  String categoryTitle;
  List<Food> displayedFood;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routearg =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routearg['id'];
    categoryTitle = routearg['title'];
    displayedFood = widget.availableFood.where((food) {
      return food.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return FoodThumb(
            displayedFood[index].title,
            displayedFood[index].imageUrl,
            displayedFood[index].duration,
            displayedFood[index].distance,
            displayedFood[index].openTime,
            displayedFood[index].id,
          );
        },
        itemCount: displayedFood.length,
      ),
    );
  }
}
