// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_definition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CocktailDefinitionAdapter extends TypeAdapter<CocktailDefinition> {
  @override
  final int typeId = 1;

  @override
  CocktailDefinition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CocktailDefinition(
      id: fields[10] as dynamic,
      name: fields[11] as String?,
      drinkThumbUrl: fields[12] as String?,
      isFavourite: fields[13] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CocktailDefinition obj) {
    writer
      ..writeByte(4)
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
      other is CocktailDefinitionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
