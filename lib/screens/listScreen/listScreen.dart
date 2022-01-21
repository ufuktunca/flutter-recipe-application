import 'package:your_reciper/api/api.dart';
import 'package:your_reciper/screens/detailPage/detailPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../loginScreen/loginScreen.dart';
import '../registerScreen/registerScreen.dart';

import '../../components.dart';
import '../../datas/datas.dart';
import '../drawer/drawer.dart';

class ListScreen extends StatefulWidget {
  String userName;

  ListScreen(this.userName);

  @override
  _ListScreenState createState() => _ListScreenState(userName);
}

class _ListScreenState extends State<ListScreen> {
  String username;

  _ListScreenState(this.username);

  List<Drinks> drinks = [];

  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Service.getNew().then((value) => {
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
        title: Text("All Recipes"),
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
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(drinks[index].strInstructions),
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
                                        username, drinks[index].idDrink);
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
