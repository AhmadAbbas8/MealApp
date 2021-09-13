import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/moduls/meal.dart';
class mealDeatalsScreen extends StatelessWidget {
  static const routName = 'meal_details';
  final Function togglfavorite ;
  final Function isFavorite;

mealDeatalsScreen(this.togglfavorite, this.isFavorite);
  Widget builsSectionTitle(BuildContext context , String text ,){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Text(text, style: Theme.of(context).textTheme.title,),
  );
  }
  Widget buildContaner (Widget child){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white ,
          border: Border.all(color: Colors.grey) ,
          borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child ,
    );
  }
  @override
  Widget build(BuildContext context) {
    final mealId =ModalRoute.of(context).settings.arguments as String ;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id==mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl , fit: BoxFit.cover,),
            ) ,
           builsSectionTitle(context, 'INFO'),
            buildContaner(ListView.builder(
              itemCount:selectedMeal.ingredients.length ,
              itemBuilder: (context , index)=> Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5 ,horizontal: 5),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              ),
            )),
            builsSectionTitle(context, 'STEPS'),
            buildContaner(ListView.builder(
              itemCount:selectedMeal.steps.length ,
              itemBuilder: (context , index)=> Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('#${index+1}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey[400],
                    thickness: 5,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>togglfavorite(mealId),
        child: Icon(
          isFavorite(mealId) ?Icons.star :Icons.star_border
        ),
      ),
    );
  }
}
