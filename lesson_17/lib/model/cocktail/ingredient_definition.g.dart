// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_definition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngredientDefinitionAdapter extends TypeAdapter<IngredientDefinition> {
  @override
  final int typeId = 5;

  @override
  IngredientDefinition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IngredientDefinition(
      id: fields[0] as String,
      ingredientName: fields[1] as String,
      measure: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, IngredientDefinition obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.ingredientName)
      ..writeByte(2)
      ..write(obj.measure);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientDefinitionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
