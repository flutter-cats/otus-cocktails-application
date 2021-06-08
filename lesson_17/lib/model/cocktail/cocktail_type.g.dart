// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CocktailTypeAdapter extends TypeAdapter<CocktailType> {
  @override
  final int typeId = 3;

  @override
  CocktailType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CocktailType(
      id: fields[0] as String,
      name: fields[2] as String,
      value: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CocktailType obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CocktailTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
