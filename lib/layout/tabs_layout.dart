import 'package:flutter/material.dart';
import 'package:dicoding_food/model/food.dart';
import 'package:dicoding_food/layout/save_food.dart';
import 'package:dicoding_food/thumbnail/main_layout.dart';
import 'package:dicoding_food/layout/category_layout.dart';

class TabsScreen extends StatefulWidget {
  final List<Food> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoryLayout(), 'title': 'Categories'},
      {'page': SaveFood(widget.favoriteMeals), 'title': 'Your Favorites'}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return // DefaultTabController(
      //     length: 2,
      //     // initialIndex: 1,  inorder to have the default tab changed.
      //     child: Scaffold(
      //       appBar: AppBar(
      //         title: Text('Meals'),
      //         bottom: TabBar(
      //           tabs: [
      //             Tab(icon: Icon(Icons.category), text: 'Categroies'),
      //             Tab(
      //               icon: Icon(Icons.star),
      //               text: 'Favorite',
      //             )
      //           ],
      //         ),
      //       ),
      //       body: TabBarView(
      //         children: [CategoryScreen(), FavoriteScreen()],
      //       ),
      //     ));
      Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
        ),
        drawer: MainLayout(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          //type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favorites',
            )
          ],
        ),
      );
  }
}
