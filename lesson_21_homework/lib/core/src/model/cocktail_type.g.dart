// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CocktailTypeAdapter extends TypeAdapter<CocktailType> {
  @override
  final int typeId = 5;

  @override
  CocktailType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CocktailType(
      fields[5] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CocktailType obj) {
    writer
      ..writeByte(2)
      ..writeByte(4)
      ..write(obj.value)
      ..writeByte(5)
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
