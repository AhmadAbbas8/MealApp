import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/widgte/catogery_item.dart';

class catogeryScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((catdata) =>
       catogeryItem( catdata.id, catdata.title, catdata.color)
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2 ,
          crossAxisSpacing: 20 ,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
