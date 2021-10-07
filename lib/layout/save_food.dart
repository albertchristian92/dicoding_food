import 'package:flutter/material.dart';
import 'package:dicoding_food/model/food.dart';
import 'package:dicoding_food/thumbnail/food_thumb.dart';

class SaveFood extends StatelessWidget {
  final List<Food> favoriteMeals;
  //constructor
  SaveFood(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return FoodThumb(
            favoriteMeals[index].title,
            favoriteMeals[index].imageUrl,
            favoriteMeals[index].duration,
            favoriteMeals[index].complexity,
            favoriteMeals[index].affordability,
            favoriteMeals[index].id,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
