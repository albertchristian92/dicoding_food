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
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  initState() {
    _glutenFree = widget.updatedfilter['gluten'];
    _vegetarian = widget.updatedfilter['vegatarian'];
    _vegan = widget.updatedfilter['vegan'];
    _lactoseFree = widget.updatedfilter['lactose'];
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
          title: Text('Your Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegatarian': _vegetarian,
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
                  'Adjust your Meal Selection.',
                  style: Theme.of(context).textTheme.headline6,
                )),
            Expanded(
                child: ListView(
                  children: [
                    buildswitchlist(
                        'Gluten-Free', 'Only include gluten-free meals.',
                            (newvalue) {
                          setState(() {
                            _glutenFree = newvalue;
                          });
                        }, _glutenFree),
                    buildswitchlist(
                        'Lactose-Free', 'Only include Lactose-free meals.',
                            (newvalue) {
                          setState(() {
                            _lactoseFree = newvalue;
                          });
                        }, _lactoseFree),
                    buildswitchlist('Vegetarian', 'Only include Vegetarian meals.',
                            (newvalue) {
                          setState(() {
                            _vegetarian = newvalue;
                          });
                        }, _vegetarian),
                    buildswitchlist('Vegan', 'Only include Vegan meals.',
                            (newvalue) {
                          setState(() {
                            _vegan = newvalue;
                          });
                        }, _vegan),
                  ],
                ))
          ],
        ));
  }
}
