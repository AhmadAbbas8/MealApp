import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/moduls/meal.dart';
import 'package:mealapp/screens/catogery_Screen.dart';
import 'package:mealapp/screens/catogery_meals_screen.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/meal_deatls_screen.dart';
import 'package:mealapp/screens/tabs_screen.dart';
import 'screens/catogery_meals_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map <String ,bool> _filters = {
    'gluten':false ,
    'lactose':false ,
    'Vegetarian':false ,
    'Vegan' :false ,
  } ;
  List <meal> _avilableMeal = DUMMY_MEALS ;
  List <meal> _favoriteMeal = [] ;
  Void _setFilters (Map <String ,bool> _filtersData){
setState(() {
  _filters =_filtersData ;
  _avilableMeal =DUMMY_MEALS.where((elemnt){
    if (_filters ['gluten'] &&!elemnt.isGlutenFree){
      return false ;
    }
    if (_filters ['lactose'] &&!elemnt.isLactoseFree){
      return false ;
    }
    if (_filters ['Vegetarian'] &&!elemnt.isVegetarian){
      return false ;
    }
    if (_filters ['Vegan'] &&!elemnt.isVegan){
      return false ;
    }
    return true ;
  }).toList();
});
  }
  void _togglfavorite (String mealId){
final exestingIndex = _favoriteMeal.indexWhere((element) => element.id==mealId);
if (exestingIndex>=0){
  setState(() {
    _favoriteMeal.removeAt(exestingIndex);
  });
}else{
  setState(() {
    _favoriteMeal.add(DUMMY_MEALS.firstWhere((element) => element.id==mealId));
  });
}
  }
  bool _ismealFavorite(String id){
    return _favoriteMeal.any((element) => element.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'meal App',
      theme: ThemeData(
        primaryColor: Colors.pink[400],
        accentColor: Colors.amber ,
         canvasColor: Color.fromRGBO(255, 254, 229, 1) ,
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 20, 50, 1)
          ),
          body2: TextStyle(
              color: Color.fromRGBO(20, 20, 50, 1)
          ),
          title: TextStyle(
            fontSize: 20 ,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),

        )
      ),
      debugShowCheckedModeBanner: false,
      // home: catogeryScreen(),
      routes: {
        '/':(context)=>tabScreen(_favoriteMeal),
        catogeryMealScreen.routName:(context)=> catogeryMealScreen(_avilableMeal) ,
        mealDeatalsScreen.routName:(context)=> mealDeatalsScreen(_togglfavorite ,_ismealFavorite),
        filterScreen.routName:(context)=>filterScreen(_setFilters , _filters),
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'mael App'
        ),
      ),
      body: null,
    );
  }
}
