// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CocktailCategoryAdapter extends TypeAdapter<CocktailCategory> {
  @override
  final int typeId = 2;

  @override
  CocktailCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CocktailCategory(
      id: fields[0] as String,
      name: fields[2] as String,
      value: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CocktailCategory obj) {
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
      other is CocktailCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
