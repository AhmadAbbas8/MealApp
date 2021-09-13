import 'package:flutter/material.dart';
import 'package:mealapp/moduls/meal.dart';
import 'package:mealapp/screens/meal_deatls_screen.dart';

class mealItem extends StatelessWidget {
  final String imageUrl;
  final String id;

  final String title;

  final int duration;

  final Complexity complexity;
  final Affordability affordapility;
  final Function romoveItem;



  mealItem(
      {
        @required this.id,
        @required this.imageUrl,
        @required this.title,
        @required this.duration,
        @required this.complexity,
        @required this.affordapility,
        this.romoveItem});

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(mealDeatalsScreen.routName , arguments: id).then((value) {
      //if(value !=null) romoveItem(value);

    }
    );
  }
  String get complexitytext{
switch(complexity){
  case Complexity.Simple : return 'Simple'; break;
  case Complexity.Challenging : return 'Challenging'; break;
  case Complexity.Hard : return 'Hard'; break;
  default: return 'Unknown' ; break;
}
}

  String get affordapilitytext{
    switch(affordapility){
      case Affordability.afforAble : return 'afforAble'; break;
      case Affordability.Luxurious : return 'Luxurious'; break;
      case Affordability.Pricey : return 'Pricey'; break;
      default: return 'Unknown' ; break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(14),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl , height: 200,width: double.infinity,fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 20),
                    child: Text(
                      title ,
                      style: TextStyle(fontSize: 26 ,color: Colors.white),
                      softWrap: true, overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text('$complexitytext'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text('$affordapilitytext'),
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
