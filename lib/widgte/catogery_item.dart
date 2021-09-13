import 'package:flutter/material.dart';
import '../screens/catogery_meals_screen.dart';
class catogeryItem extends StatelessWidget {
  final String id;

  final String title;

  final Color color;

   catogeryItem( this.id, this.title, this.color);
  void selectCategory(BuildContext context){
Navigator.of(context).pushNamed(
    catogeryMealScreen.routName,
    arguments: {
      'id':id,
      'title':title,

    }
);
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20) ,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(title , style: Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20) ,
          gradient: LinearGradient(
            colors:[
              color.withOpacity(0.4),
              color,
            ] ,
            begin: Alignment.topLeft,
            end:Alignment.bottomRight ,
          )
        ),
      ),
    );
  }
}
