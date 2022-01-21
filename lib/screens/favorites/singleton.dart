import 'package:your_reciper/api/api.dart';

class Singleton {
  List<Drinks> favoriteDrinks = [];

  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  addFavorite(Drinks drink) {
    favoriteDrinks.add(drink);
  }

  List<Drinks> getFavorites() {
    return favoriteDrinks;
  }

  Singleton._internal();
}
