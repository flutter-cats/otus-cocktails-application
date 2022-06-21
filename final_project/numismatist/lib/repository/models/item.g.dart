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
      id: fields[0] as String,
      catalogId: fields[1] as String,
      name: fields[2] as String,
      description: fields[3] as String,
      nominal: fields[4] as num,
      currency: fields[5] as Currency,
      material: fields[6] as String,
      weight: fields[7] as num?,
      circulation: fields[8] as int?,
      years: (fields[9] as List).cast<int>(),
      facilities: (fields[10] as List).cast<String>(),
      lastUpdate: fields[11] as DateTime,
      averse: fields[12] as Uint8List?,
      reverse: fields[13] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.catalogId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.nominal)
      ..writeByte(5)
      ..write(obj.currency)
      ..writeByte(6)
      ..write(obj.material)
      ..writeByte(7)
      ..write(obj.weight)
      ..writeByte(8)
      ..write(obj.circulation)
      ..writeByte(9)
      ..write(obj.years)
      ..writeByte(10)
      ..write(obj.facilities)
      ..writeByte(11)
      ..write(obj.lastUpdate)
      ..writeByte(12)
      ..write(obj.averse)
      ..writeByte(13)
      ..write(obj.reverse);
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
