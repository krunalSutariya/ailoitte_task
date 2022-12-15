// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CocktailModel _$CocktailModelFromJson(Map<String, dynamic> json) =>
    CocktailModel(
      drinks: (json['drinks'] as List<dynamic>?)
              ?.map((e) => DrinksModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CocktailModelToJson(CocktailModel instance) =>
    <String, dynamic>{
      'drinks': instance.drinks,
    };
