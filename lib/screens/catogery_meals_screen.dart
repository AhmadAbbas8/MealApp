import 'package:flutter/material.dart';
import 'package:mealapp/moduls/meal.dart';
import 'package:mealapp/widgte/meal_items.dart';
import '../dummy_data.dart';
class catogeryMealScreen extends StatefulWidget {
  static const routName = 'category_meals';
final List<meal>avilableMeal ;
catogeryMealScreen(this.avilableMeal);
  @override
  _catogeryMealScreenState createState() => _catogeryMealScreenState();
}
class _catogeryMealScreenState extends State<catogeryMealScreen> {
  @override

  String categorytitle ;
  List <meal> displayMeal ;
  @override
  void didChangeDependencies() {
    final routArg =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routArg['id'];
    categorytitle = routArg['title'];
    displayMeal = widget.avilableMeal.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal (String mealId){
   setState(() {
     displayMeal.removeWhere((element) => element.id==mealId);
   });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return mealItem(
            id: displayMeal[index].id,
            imageUrl: displayMeal[index].imageUrl,
            title: displayMeal[index].title,
            affordapility: displayMeal[index].affordapility,
            complexity: displayMeal[index].complexity,
            duration: displayMeal[index].duration,

          );
        },
        itemCount: displayMeal.length,
      ),
    );
  }
}
