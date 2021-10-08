import 'package:flutter/foundation.dart';

class Food {
  final String id;
  final List<String> categories;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> menu;
  final String duration;
  final String distance;
  final String openTime;
  final bool isHalal;
  final bool isGlutenFree;
  final bool isVegetarian;

  const Food(
      {@required this.id,
        this.categories,
        this.title,
        this.description,
        this.imageUrl,
        this.menu,
        this.duration,
        this.distance,
        this.openTime,
        this.isHalal,
        this.isGlutenFree,
        this.isVegetarian});
}
