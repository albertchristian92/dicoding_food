import 'package:dicoding_food/layout/category_food_layout.dart';
import 'package:flutter/material.dart';



class CategoryThumb extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryThumb(this.title, this.color, this.id);

  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx)
    //     .push(MaterialPageRoute(builder: (ctx) => CategoryMealScreen(id,title)));
    Navigator.of(ctx).pushNamed(
        CategoryFoodLayout.routeName,arguments: {
      'id':id,
      'title':title,
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        /*adding const in static variables speed up
        the performance of the app a little.
        */
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
