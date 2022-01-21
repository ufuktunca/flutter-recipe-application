import 'package:your_reciper/screens/favorites/favorites.dart';
import 'package:flutter/material.dart';
import '../listScreen/categoryListScreen.dart';
import '../homeScreen/homeScreen.dart';
import '../listScreen/listScreen.dart';

class HamburgerMenu extends StatelessWidget {
  String username;

  HamburgerMenu(this.username);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.all(0.0), children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text(""),
          accountName: Text(
            username,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/avatar.jpg'),
          ),
          onDetailsPressed: () {},
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/fundo.jpg"), fit: BoxFit.cover)),
        ),
        ListTile(
          title: Text('Favorites'),
          leading: Icon(Icons.favorite),
          onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return FavoriteScreen(username);
              },
            ), (route) => false);
          },
        ),
        Divider(),
        ListTile(
          title: Text('List All'),
          leading: Icon(Icons.view_list),
          onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return ListScreen(username);
              },
            ), (route) => false);
          },
        ),
        Divider(),
        ListTile(
          title: Text('Ordinary Drink'),
          leading: Icon(Icons.dashboard),
          onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return CategoryListScreen(username, "Ordinary_Drink");
              },
            ), (route) => false);
          },
        ),
        Divider(),
        ListTile(
          title: Text('Shot'),
          leading: Icon(Icons.account_tree_rounded),
          onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return CategoryListScreen(username, "Shot");
              },
            ), (route) => false);
          },
        ),
        Divider(),
        ListTile(
          title: Text('Cocktail'),
          leading: Icon(Icons.auto_awesome_sharp),
          onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return CategoryListScreen(username, "Cocktail");
              },
            ), (route) => false);
          },
        ),
        Divider(),
        ListTile(
          title: Text('Cocoa'),
          leading: Icon(Icons.bedtime),
          onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return CategoryListScreen(username, "Cocoa");
              },
            ), (route) => false);
          },
        ),
        Divider(),
        ListTile(
          title: Text('Logout'),
          leading: Icon(Icons.logout),
          onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ), (route) => false);
          },
        ),
        Divider(),
      ]),
    );
  }
}
