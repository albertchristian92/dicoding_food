import 'package:flutter/material.dart';
import 'package:dicoding_food/layout/layout_food_detail.dart';

class FoodThumb extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String duration;
  final String distance;
  final String openTime;

  FoodThumb(this.title, this.imageUrl, this.duration, this.distance, this.openTime,
      this.id);


  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(LayoutFoodDetail.routeName, arguments: id)
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.food_bank,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$openTime '),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$distance km'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
