import 'package:flutter/material.dart';
import 'package:dicoding_food/layout/filter_layout.dart';

class MainLayout extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function taphandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
      ),
      onTap: taphandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Silahkan pilih restaurant yang diinginkan',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Restoran', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filter', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterLayout.routeName);
          })
        ],
      ),
    );
  }
}
