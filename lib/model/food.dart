import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }
enum Affordability { Affordable, Pricey, Luxurious }

class Food {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> menu;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isHalal;
  final bool isLactoseFree;
  final bool isVegetarian;

  const Food(
      {@required this.id,
        this.categories,
        this.title,
        this.imageUrl,
        this.menu,
        this.duration,
        this.complexity,
        this.affordability,
        this.isHalal,
        this.isLactoseFree,
        this.isVegetarian});
}
