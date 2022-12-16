// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DrinksModelAdapter extends TypeAdapter<DrinksModel> {
  @override
  final int typeId = 0;

  @override
  DrinksModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DrinksModel(
      idDrink: fields[0] as String? ?? "",
      strDrink: fields[1] as String? ?? "",
      strCategory: fields[2] as String? ?? "",
      strDrinkThumb: fields[3] as String? ?? "",
    );
  }

  @override
  void write(BinaryWriter writer, DrinksModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.idDrink)
      ..writeByte(1)
      ..write(obj.strDrink)
      ..writeByte(2)
      ..write(obj.strCategory)
      ..writeByte(3)
      ..write(obj.strDrinkThumb);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrinksModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinksModel _$DrinksModelFromJson(Map<String, dynamic> json) => DrinksModel(
      idDrink: json['idDrink'] as String? ?? "",
      strDrink: json['strDrink'] as String? ?? "",
      strDrinkAlternate: json['strDrinkAlternate'] as String? ?? "",
      strCategory: json['strCategory'] as String? ?? "",
      strIBA: json['strIBA'] as String? ?? "",
      strTags: json['strTags'] as String? ?? "",
      strVideo: json['strVideo'] as String? ?? "",
      dateModified: json['dateModified'] as String? ?? "",
      strAlcoholic: json['strAlcoholic'] as String? ?? "",
      strCreativeCommonsConfirmed:
          json['strCreativeCommonsConfirmed'] as String? ?? "",
      strDrinkThumb: json['strDrinkThumb'] as String? ?? "",
      strGlass: json['strGlass'] as String? ?? "",
      strImageAttribution: json['strImageAttribution'] as String? ?? "",
      strImageSource: json['strImageSource'] as String? ?? "",
      strIngredient1: json['strIngredient1'] as String? ?? "",
      strIngredient2: json['strIngredient2'] as String? ?? "",
      strIngredient3: json['strIngredient3'] as String? ?? "",
      strIngredient4: json['strIngredient4'] as String? ?? "",
      strInstructions: json['strInstructions'] as String? ?? "",
      strInstructionsDE: json['strInstructionsDE'] as String? ?? "",
      strInstructionsES: json['strInstructionsES'] as String? ?? "",
      strInstructionsFR: json['strInstructionsFR'] as String? ?? "",
      strInstructionsIT: json['strInstructionsIT'] as String? ?? "",
      strInstructionsZHHANS: json['strInstructionsZH-HANS'] as String? ?? "",
      strInstructionsZHHANT: json['strInstructionsZH-HANT'] as String? ?? "",
      strMeasure1: json['strMeasure1'] as String? ?? "",
    );

Map<String, dynamic> _$DrinksModelToJson(DrinksModel instance) =>
    <String, dynamic>{
      'idDrink': instance.idDrink,
      'strDrink': instance.strDrink,
      'strDrinkAlternate': instance.strDrinkAlternate,
      'strTags': instance.strTags,
      'strVideo': instance.strVideo,
      'strCategory': instance.strCategory,
      'strIBA': instance.strIBA,
      'strAlcoholic': instance.strAlcoholic,
      'strInstructionsES': instance.strInstructionsES,
      'strGlass': instance.strGlass,
      'strInstructions': instance.strInstructions,
      'strInstructionsDE': instance.strInstructionsDE,
      'strInstructionsFR': instance.strInstructionsFR,
      'strInstructionsIT': instance.strInstructionsIT,
      'strInstructionsZH-HANS': instance.strInstructionsZHHANS,
      'strInstructionsZH-HANT': instance.strInstructionsZHHANT,
      'strDrinkThumb': instance.strDrinkThumb,
      'strIngredient1': instance.strIngredient1,
      'strIngredient2': instance.strIngredient2,
      'strIngredient3': instance.strIngredient3,
      'strIngredient4': instance.strIngredient4,
      'strImageSource': instance.strImageSource,
      'strMeasure1': instance.strMeasure1,
      'strImageAttribution': instance.strImageAttribution,
      'strCreativeCommonsConfirmed': instance.strCreativeCommonsConfirmed,
      'dateModified': instance.dateModified,
    };
