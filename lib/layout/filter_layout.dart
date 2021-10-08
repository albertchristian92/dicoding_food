import 'package:flutter/material.dart';
import 'package:dicoding_food/thumbnail/main_layout.dart';

class FilterLayout extends StatefulWidget {
  static const routeName = '/filter';
  final Function saveFilters;
  final Map<String, bool> updatedfilter;

  FilterLayout(this.updatedfilter, this.saveFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterLayout> {
  bool _halal = false;
  bool _vegetarian = false;
  bool _glutenFree = false;
  @override
  initState() {
    _halal = widget.updatedfilter['halal'];
    _vegetarian = widget.updatedfilter['vegetarian'];
    _glutenFree = widget.updatedfilter['gluten'];
    super.initState();
  }

  Widget buildswitchlist(
      String title, String subtitle, Function valuechanger, bool value) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subtitle),
      onChanged: valuechanger,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter Restoran'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'halal': _halal,
                    'gluten': _glutenFree,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilters(selectedFilters);
                  Navigator.of(context).pushReplacementNamed('/');
                })
          ],
        ),
        drawer: MainLayout(),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Pilih makanan yang kamu cari.',
                  style: Theme.of(context).textTheme.headline6,
                )),
            Expanded(
                child: ListView(
                  children: [
                    buildswitchlist(
                        'Halal', 'Makanan halal.',
                            (newvalue) {
                          setState(() {
                            _halal = newvalue;
                          });
                        }, _halal),
                    buildswitchlist(
                        'Gluten-Free', 'Makanan bebas gluten.',
                            (newvalue) {
                          setState(() {
                            _glutenFree = newvalue;
                          });
                        }, _glutenFree),
                    buildswitchlist('Vegetarian', 'Makanan Vegetarian.',
                            (newvalue) {
                          setState(() {
                            _vegetarian = newvalue;
                          });
                        }, _vegetarian),
                  ],
                ))
          ],
        ));
  }
}
