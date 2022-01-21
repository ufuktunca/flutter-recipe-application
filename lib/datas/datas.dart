import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpDart;
import '../api/api.dart';
import 'dart:convert';

class Service {
  static final Service _singleton = Service._internal();

  factory Service() {
    return _singleton;
  }

  static Future<List<Drinks>> getNew() async {
    final result = await httpDart.get(
        Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/search.php?s="));

    final resultJson = json.decode(result.body);
    AllDrinks allDrinks = AllDrinks.fromJson(resultJson);
    return allDrinks.drinks;
  }

  static Future<List<Drinks>> getWithCategory(String category) async {
    final result = await httpDart.get(Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=${category}'));

    final resultJson = json.decode(result.body);
    AllDrinks allDrinks = AllDrinks.fromJson(resultJson);
    return allDrinks.drinks;
  }

  static Future<List<Drinks>> getSpecificDrink(String drinkId) async {
    final result = await httpDart.get(Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=${drinkId}'));

    final resultJson = json.decode(result.body);
    AllDrinks allDrinks = AllDrinks.fromJson(resultJson);
    return allDrinks.drinks;
  }

  Service._internal();
}
