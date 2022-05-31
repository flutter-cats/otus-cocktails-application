// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CocktailAdapter extends TypeAdapter<Cocktail> {
  @override
  final int typeId = 0;

  @override
  Cocktail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cocktail(
      id: fields[10] as String?,
      name: fields[11] as String?,
      drinkThumbUrl: fields[12] as String?,
      isFavourite: fields[13] as bool,
      instruction: fields[0] as String?,
      category: fields[1] as CocktailCategory?,
      glassType: fields[2] as GlassType?,
      cocktailType: fields[3] as CocktailType?,
      ingredients: (fields[4] as List?)?.cast<IngredientDefinition>(),
    );
  }

  @override
  void write(BinaryWriter writer, Cocktail obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.instruction)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.glassType)
      ..writeByte(3)
      ..write(obj.cocktailType)
      ..writeByte(4)
      ..write(obj.ingredients?.toList())
      ..writeByte(10)
      ..write(obj.id)
      ..writeByte(11)
      ..write(obj.name)
      ..writeByte(12)
      ..write(obj.drinkThumbUrl)
      ..writeByte(13)
      ..write(obj.isFavourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CocktailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
