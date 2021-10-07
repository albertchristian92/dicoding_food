import 'package:flutter/material.dart';

import 'package:dicoding_food/thumbnail/category_thumb.dart';
import 'package:dicoding_food/food_data.dart';

class CategoryLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: food_type.map((item) {
        return CategoryThumb(item.title, item.color, item.id);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
