import 'package:flutter/material.dart';
import 'package:mealapp/moduls/meal.dart';
import 'package:mealapp/widgte/main_drawer.dart';

import 'catogery_Screen.dart';
import 'fav_Screen.dart';

class tabScreen extends StatefulWidget {
  final List<meal>  favoriteMeal ;
  tabScreen( this.favoriteMeal);
  @override
  _tabScreenState createState() => _tabScreenState();
}

class _tabScreenState extends State<tabScreen> {
   List<Map<String, Object>> _pages ;
  int _selectedPageIndex = 0;
 @override
 void initState() {
     _pages =  [
       {
         'page': catogeryScreen(),
         'title': 'Catogries',
       },
       {
         'page': favScreen(widget.favoriteMeal),
         'title': 'your favorite',
       }
     ] ;
    super.initState();
  }
  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: mainDrawer(

      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('favorites')),
        ],
      ),
    );
  }
}
