import 'package:your_reciper/api/api.dart';
import 'package:your_reciper/screens/favorites/singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import '../loginScreen/loginScreen.dart';
import '../registerScreen/registerScreen.dart';

import '../../components.dart';
import '../../datas/datas.dart';
import '../drawer/drawer.dart';

class DetailScreen extends StatefulWidget {
  String userName;
  String drinkId;

  DetailScreen(this.userName, this.drinkId);

  @override
  _DetailScreenState createState() => _DetailScreenState(userName, drinkId);
}

class _DetailScreenState extends State<DetailScreen> {
  String username;
  String drinkId;

  var favoriteDrinks = Singleton();

  _DetailScreenState(this.username, this.drinkId);

  List<Drinks> drinks = [];

  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Service.getSpecificDrink(drinkId).then((value) => {
            setState(() {
              drinks = value;
            })
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HamburgerMenu(username),
      appBar: AppBar(
        title: Text("Drink Details"),
        backgroundColor: Color.fromRGBO(213, 160, 33, 1),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: ListView.builder(
              itemCount: drinks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Image.network(drinks[index].strDrinkThumb),
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: Text(drinks[index].strDrink),
                        subtitle: Text(drinks[index].strCategory),
                      ),
                      Row(
                        children: [
                          Text(
                            "Tags",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          if (drinks[index].strInstructions != null) ...[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            ),
                            Text(
                              "English Instruction",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(drinks[index].strInstructions),
                          ],
                        ],
                      ),
                      Column(
                        children: [
                          if (drinks[index].strInstructionsES != null) ...[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            ),
                            Text(
                              "Spanish Instruction",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(drinks[index].strInstructionsES),
                          ],
                        ],
                      ),
                      Column(
                        children: [
                          if (drinks[index].strInstructionsIT != null) ...[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            ),
                            Text(
                              "Italian Instruction",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(drinks[index].strInstructionsIT),
                          ],
                        ],
                      ),
                      Column(
                        children: [
                          if (drinks[index].strInstructionsDE != null) ...[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            ),
                            Text(
                              "Deustch Instruction",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(drinks[index].strInstructionsDE),
                          ],
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      ),
                      FlatButton(
                          color: Color.fromRGBO(67, 87, 173, 1),
                          minWidth: double.infinity,
                          onPressed: () {
                            favoriteDrinks.addFavorite(drinks[index]);
                          },
                          child: Text(
                            "Add To My Favorites",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                );
              })),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final Function press;
  final String text;

  CustomElevatedButton(this.press, this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(text),
      style: ElevatedButton.styleFrom(
          primary: kPrimaryColorTwo,
          padding: EdgeInsets.symmetric(vertical: 15),
          elevation: 5,
          shadowColor: Colors.black),
    );
  }
}
