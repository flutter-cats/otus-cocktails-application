// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 1;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String,
      currency: fields[3] as String,
      nominal: fields[4] as num,
      circulation: fields[5] as int,
      years: (fields[6] as List).cast<int>(),
      facilities: (fields[7] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.currency)
      ..writeByte(4)
      ..write(obj.nominal)
      ..writeByte(5)
      ..write(obj.circulation)
      ..writeByte(6)
      ..write(obj.years)
      ..writeByte(7)
      ..write(obj.facilities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
