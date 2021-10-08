import 'package:flutter/material.dart';

import 'package:dicoding_food/food_data.dart';

class LayoutFoodDetail extends StatelessWidget {
  static const routeName = '/food-detail';
  final Function favoritetoggler;
  final Function isLove;
  LayoutFoodDetail(this.favoritetoggler, this.isLove);
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ));
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  Widget buildDescription(Widget child) {
    return Container(
      height: 150,
      width: 400,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final foodId = ModalRoute.of(context).settings.arguments as String;
    final selectedFood =
    food_data.firstWhere((element) => element.id == foodId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedFood.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedFood.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildDescription(
                Text(selectedFood.description)
            ),
            buildSectionTitle(context, "Menu"),
            buildContainer(ListView.builder(
              itemCount: selectedFood.menu.length,
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(selectedFood.menu[index]),
                  ),
                  Divider(),
                ],
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isLove(foodId) ? Icons.star : Icons.star_border),
        onPressed: () {
          favoritetoggler(foodId);
        },
      ),
    );
  }
}
