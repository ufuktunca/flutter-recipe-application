import 'package:your_reciper/api/api.dart';
import 'package:your_reciper/screens/detailPage/detailPage.dart';
import 'package:your_reciper/screens/favorites/singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../loginScreen/loginScreen.dart';
import '../registerScreen/registerScreen.dart';

import '../../components.dart';
import '../../datas/datas.dart';
import '../drawer/drawer.dart';

class FavoriteScreen extends StatefulWidget {
  String userName;

  FavoriteScreen(this.userName);
  var favorites = Singleton();

  @override
  _FavoriteScreenState createState() =>
      _FavoriteScreenState(userName, favorites.getFavorites());
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String username;
  List<Drinks> favorites = [];

  _FavoriteScreenState(this.username, this.favorites);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HamburgerMenu(username),
      appBar: AppBar(
        title: Text("Favorites"),
        backgroundColor: Color.fromRGBO(213, 160, 33, 1),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Image.network(favorites[index].strDrinkThumb),
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: Text(favorites[index].strDrink),
                        subtitle: Text(favorites[index].strCategory),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(favorites[index].strInstructions),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return DetailScreen(
                                        username, favorites[index].idDrink);
                                  },
                                ), (route) => false);
                              },
                              child: Text("Go to detail page"))
                        ],
                      )
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
