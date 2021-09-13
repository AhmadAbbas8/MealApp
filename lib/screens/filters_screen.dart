import 'package:flutter/material.dart';
import 'package:mealapp/widgte/main_drawer.dart';

class filterScreen extends StatefulWidget {
  static const routName = '/filters';
  final Function SaveFilters ;
  final Map <String , bool > currentFilters ;
  filterScreen(this.SaveFilters, this.currentFilters);

  @override
  _filterScreenState createState() => _filterScreenState();
}

class _filterScreenState extends State<filterScreen> {
  bool _isGlutenFree = false;

  bool _isLactoseFree = false;

  bool _isVegan = false;
  bool _isVegetarian = false;
  @override
  initState(){
    bool _isGlutenFree = widget.currentFilters['gluten'];

    bool _isLactoseFree = widget.currentFilters['lactose'];

    bool _isVegan = widget.currentFilters['Vegetarian'];
    bool _isVegetarian = widget.currentFilters['Vegan'];
    super.initState();
  }

  Widget buildSwitchlistTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w900),
      ),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: [
          IconButton(
          icon: Icon(Icons.save),
          onPressed:() {
            final selectedFilter = {
              'gluten':_isGlutenFree ,
              'lactose': _isLactoseFree ,
              'Vegetarian':_isVegetarian,
              'Vegan' :_isVegan,
            };
            widget.SaveFilters(selectedFilter);
          },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'just add your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchlistTile(
                  'Gluten-Free',
                  'only include gluten free meal',
                  _isGlutenFree,
                  (newValue) {
                    setState(
                      () {
                        _isGlutenFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchlistTile(
                  'lactose-Free',
                  'only include lactose free meal',
                  _isLactoseFree,
                      (newValue) {
                    setState(
                          () {
                            _isLactoseFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchlistTile(
                  'Vegetarian',
                  'only include Vegetarian free meal',
                  _isVegetarian,
                      (newValue) {
                    setState(
                          () {
                            _isVegetarian = newValue;
                      },
                    );
                  },
                ),
                buildSwitchlistTile(
                  'Vegan',
                  'only include Vegan free meal',
                  _isVegan,
                      (newValue) {
                    setState(
                          () {
                        _isVegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: mainDrawer(),
    );
  }
}
