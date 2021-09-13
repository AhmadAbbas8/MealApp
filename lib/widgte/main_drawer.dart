import 'package:flutter/material.dart';
import 'package:mealapp/screens/filters_screen.dart';

class mainDrawer extends StatelessWidget {
 Widget buildListTile(String title , IconData icon ,Function funTab){
   return  ListTile(
     onTap: funTab,
     leading: Icon(icon, size: 26,),
     title: Text(title ,style: TextStyle(
         fontSize: 24 ,
         fontFamily: 'RobotoCondensed',
         fontWeight: FontWeight.bold
     )),
   );
 }

  @override
  Widget build(BuildContext context) {
    return Drawer(
child: Column(
  children: [
    Container(
      height: 300,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      alignment: Alignment.centerLeft,
      color: Theme.of(context).accentColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/78622670?v=4'),
                ),
              ],
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ahmad Abbas' ,
                    style: TextStyle(
                      color: Colors.white ,
                      fontWeight: FontWeight.w900 ,
                      fontSize: 25 ,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.account_circle_outlined ,size: 30,)
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    SizedBox(height: 20,),
    buildListTile('Meal', Icons.restaurant ,(){Navigator.of(context).pushReplacementNamed('/');}),
    buildListTile('Filtrs',Icons.settings ,(){Navigator.of(context).pushReplacementNamed(filterScreen.routName);}) ,
    buildListTile('LogOut', Icons.logout,(){Navigator.of(context).pushReplacementNamed('/');})
  ],
),
    );
  }
}
