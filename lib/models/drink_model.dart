import 'package:json_annotation/json_annotation.dart';

part 'drink_model.g.dart';

@JsonSerializable()
class DrinksModel {
  final String idDrink;
  final String strDrink;
  final String strDrinkAlternate;
  final String strTags;
  final String strVideo;
  final String strCategory;
  final String strIBA;
  final String strAlcoholic;
  final String strInstructionsES;
  final String strGlass;
  final String strInstructions;
  final String strInstructionsDE;
  final String strInstructionsFR;
  final String strInstructionsIT;
  @JsonKey(name: "strInstructionsZH-HANS")
  final String strInstructionsZHHANS;
  @JsonKey(name: "strInstructionsZH-HANT")
  final String strInstructionsZHHANT;
  final String strDrinkThumb;
  final String strIngredient1;
  final String strIngredient2;
  final String strIngredient3;
  final String strIngredient4;
  final String strImageSource;
  final String strMeasure1;
  final String strImageAttribution;
  final String strCreativeCommonsConfirmed;
  final String dateModified;

  DrinksModel(
      {this.idDrink = "",
      this.strDrink = "",
      this.strDrinkAlternate = "",
      this.strCategory = "",
      this.strIBA = "",
      this.strTags = "",
      this.strVideo = "",
      this.dateModified = "",
      this.strAlcoholic = "",
      this.strCreativeCommonsConfirmed = "",
      this.strDrinkThumb = "",
      this.strGlass = "",
      this.strImageAttribution = "",
      this.strImageSource = "",
      this.strIngredient1 = "",
      this.strIngredient2 = "",
      this.strIngredient3 = "",
      this.strIngredient4 = "",
      this.strInstructions = "",
      this.strInstructionsDE = "",
      this.strInstructionsES = "",
      this.strInstructionsFR = "",
      this.strInstructionsIT = "",
      this.strInstructionsZHHANS = "",
      this.strInstructionsZHHANT = "",
      this.strMeasure1 = ""});

  /// Connect the generated [_$DrinksModelFromJson] function to the `fromJson`
  /// factory.
  factory DrinksModel.fromJson(Map<String, dynamic> json) =>
      _$DrinksModelFromJson(json);

  /// Connect the generated [_$DrinksModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DrinksModelToJson(this);
}
