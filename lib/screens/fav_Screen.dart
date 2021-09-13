import 'package:flutter/material.dart';
import 'package:mealapp/moduls/meal.dart';
import 'package:mealapp/widgte/meal_items.dart';

class favScreen extends StatelessWidget {
  final List<meal> favoriteMeal;

  favScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text('you have not favorite yet - start have some!'),
      );
    }else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return mealItem(
            id: favoriteMeal[index].id,
            imageUrl: favoriteMeal[index].imageUrl,
            title: favoriteMeal[index].title,
            affordapility: favoriteMeal[index].affordapility,
            complexity: favoriteMeal[index].complexity,
            duration: favoriteMeal[index].duration,

          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}