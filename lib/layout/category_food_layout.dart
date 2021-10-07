import 'package:flutter/material.dart';
import 'package:dicoding_food/model/food.dart';
import 'package:dicoding_food/thumbnail/food_thumb.dart';



class CategoryFoodLayout extends StatefulWidget {
  static const routeName = '/categories-meals';
  final List<Food> availableMeals;
  CategoryFoodLayout(this.availableMeals);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryFoodLayout> {
  String categoryTitle;
  List<Food> displayedMeals;
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
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
  //this functions is not used anymore, i only wrote it down for testing and revision purpose.
  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return FoodThumb(
            displayedMeals[index].title,
            displayedMeals[index].imageUrl,
            displayedMeals[index].duration,
            displayedMeals[index].complexity,
            displayedMeals[index].affordability,
            displayedMeals[index].id,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
