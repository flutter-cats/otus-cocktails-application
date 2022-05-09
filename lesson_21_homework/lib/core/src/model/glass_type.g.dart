// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'glass_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GlassTypeAdapter extends TypeAdapter<GlassType> {
  @override
  final int typeId = 4;

  @override
  GlassType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GlassType(
      fields[34] as String,
      fields[33] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GlassType obj) {
    writer
      ..writeByte(2)
      ..writeByte(33)
      ..write(obj.value)
      ..writeByte(34)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlassTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
