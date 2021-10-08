import 'package:flutter/material.dart';
import 'package:dicoding_food/model/food.dart';
import 'package:dicoding_food/thumbnail/food_thumb.dart';

class SaveFood extends StatelessWidget {
  final List<Food> loveFood;
  //constructor
  SaveFood(this.loveFood);

  @override
  Widget build(BuildContext context) {
    if (loveFood.isEmpty) {
      return Center(
        child: Text('Belum ada restoran yang disimpan'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return FoodThumb(
            loveFood[index].title,
            loveFood[index].imageUrl,
            loveFood[index].duration,
            loveFood[index].distance,
            loveFood[index].openTime,
            loveFood[index].id,
          );
        },
        itemCount: loveFood.length,
      );
    }
  }
}
