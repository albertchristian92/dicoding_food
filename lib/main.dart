import 'package:flutter/material.dart';

import 'package:dicoding_food/layout/category_food_layout.dart';
import 'package:dicoding_food/layout/category_layout.dart';
import 'package:dicoding_food/layout/filter_layout.dart';
import 'package:dicoding_food/layout/layout_food_detail.dart';
import 'package:dicoding_food/layout/tabs_layout.dart';

import 'package:dicoding_food/food_data.dart';
import 'package:dicoding_food/model/food.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends  State<MyApp> {
  Map<String, bool> _filters = {
    'halal': false,
    'gluten': false,
    'vegetarian': false,
  };
  List<Food> _availableFoods = food_data;
  List<Food> _loveFoods = [];
  void _setFilter(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;
      _availableFoods = food_data.where((food) {
        if (_filters['halal'] && !food.isHalal) {
          return false;
        }
        if (_filters['gluten'] && !food.isGlutenFree) {
          return false;
        }
        if (_filters['vegetarian'] && !food.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
    _loveFoods.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _loveFoods.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _loveFoods
            .add(food_data.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isFoodFavorite(String id) {
    return _loveFoods.any((element) => element.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restoran Dicoding ',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),

      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => TabsScreen(_loveFoods),
        CategoryFoodLayout.routeName: (ctx) =>
            CategoryFoodLayout(_availableFoods),
        LayoutFoodDetail.routeName: (ctx) => LayoutFoodDetail(_toggleFavorite,_isFoodFavorite),
        FilterLayout.routeName: (ctx) => FilterLayout(_filters, _setFilter),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryLayout());
      },
    );
  }
}
