// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';

import '../api/api_end_point.dart';
import '../api/api_middlware.dart';
import '../models/cocktail_model.dart';
import '../models/drink_model.dart';

class CocktailProvider with ChangeNotifier {
  // Cocktail List
  List<DrinksModel> _cocktailList = [];

  //------------------getter/setter---------------//

  //Cocktail getter/setter method
  List<DrinksModel> get cocktailList => _cocktailList;
  set cocktailList(List<DrinksModel> value) => _cocktailList = value;

  //----------------------------Function------------------------------//

  // Fethc Frinks Data
  Future<void> fetchDrinksData({String search = ""}) async {
    try {
      final response = await ApiMiddleware.instance
          .callService(endPoint: APIEndPoint.search, parms: {"s": search});

      CocktailModel cocktailModel = CocktailModel.fromJson(response.data);
      cocktailList = cocktailModel.drinks;

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
