// ignore_for_file: unnecessary_getters_setters

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../api/api_end_point.dart';
import '../models/drink_model.dart';

class FavoriteProvider with ChangeNotifier {
  // Favorite item box
  late Box<DrinksModel> _favoriteItemBox;

  //! ----------------------------Function------------------------------//

  // Favorite items...
  Stream<List<DrinksModel>> fetchFavoriteItemList() {
    try {
      return Stream.value(_favoriteItemBox.values.toList());
    } catch (e) {
      rethrow;
    }
  }

  // Open box...
  Future<void> openBox() async {
    Directory tempDir = await getApplicationSupportDirectory();
    String tempPath = tempDir.path;

    // Init...
    Hive
      ..init(tempPath)
      ..registerAdapter(DrinksModelAdapter());
    _favoriteItemBox = await Hive.openBox<DrinksModel>(APISetup.boxName);
  }

  // Favroite btn tap action...
  void favroiteOnTapAction(DrinksModel? drink) {
    if (!isFavroite(drink)) {
      addToFavorite(drink);
    } else {
      removeFromFavorite(drink);
    }
  }

  // Check is favroite or not...
  bool isFavroite(DrinksModel? drink) =>
      _favoriteItemBox.get(drink?.idDrink) != null;

  // Add to favorite...
  Future<void> addToFavorite(DrinksModel? drink) async {
    if (drink == null) {
      return;
    }

    await _favoriteItemBox.put(drink.idDrink, drink);
    notifyListeners();
  }

  // Remove from favroite...
  void removeFromFavorite(DrinksModel? drink) {
    _favoriteItemBox.delete(drink?.idDrink);
    notifyListeners();
  }

  // Get single drink info by drink id...
  DrinksModel? getSingleDrinkInfo(DrinksModel? drink) {
    return _favoriteItemBox.get(drink?.idDrink);
  }
}
