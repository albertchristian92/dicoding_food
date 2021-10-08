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
    'lactose': false,
    'vegetarian': false,
  };
  List<Food> _availableFoods = food_data;
  List<Food> _loveFoods = [];
  void _setFilter(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;
      _availableFoods = food_data.where((food) {
        if (_filters['gluten'] && !food.isHalal) {
          return false;
        }
        if (_filters['lactose'] && !food.isLactoseFree) {
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
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      //home: CategoryScreen(),
      //to remove the debug banner on the application
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => TabsScreen(_loveFoods),
        CategoryFoodLayout.routeName: (ctx) =>
            CategoryFoodLayout(_availableFoods),
        LayoutFoodDetail.routeName: (ctx) => LayoutFoodDetail(_toggleFavorite,_isFoodFavorite),
        FilterLayout.routeName: (ctx) => FilterLayout(_filters, _setFilter),
      },
      // ignore: missing_return
      onGenerateRoute: (settings) {
        //generate route enables u to create new pages instantly while in the cycle of the app's life.
        print(settings.arguments); //to display the name
        // return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
      //unknown route is used to enable a fallback from last resort of the app.
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryLayout());
      },
    );
  }
}
