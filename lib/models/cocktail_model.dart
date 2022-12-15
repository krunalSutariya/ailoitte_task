import 'package:ailoitte_task/models/drink_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cocktail_model.g.dart';

@JsonSerializable()
class CocktailModel {
  List<DrinksModel> drinks;

  CocktailModel({this.drinks = const []});

  /// Connect the generated [_$CocktailModelFromJson] function to the `fromJson`
  /// factory.
  factory CocktailModel.fromJson(Map<String, dynamic> json) =>
      _$CocktailModelFromJson(json);

  /// Connect the generated [_$CocktailModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CocktailModelToJson(this);
}
