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
      name: fields[1] as String,
      description: fields[2] as String,
      nominal: fields[3] as num,
      currency: fields[4] as Currency,
      material: fields[5] as String,
      weight: fields[6] as num?,
      circulation: fields[7] as int?,
      years: (fields[8] as List).cast<int>(),
      facilities: (fields[9] as List).cast<String>(),
      lastUpdate: fields[10] as DateTime,
      averse: fields[11] as Uint8List?,
      reverse: fields[12] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.nominal)
      ..writeByte(4)
      ..write(obj.currency)
      ..writeByte(5)
      ..write(obj.material)
      ..writeByte(6)
      ..write(obj.weight)
      ..writeByte(7)
      ..write(obj.circulation)
      ..writeByte(8)
      ..write(obj.years)
      ..writeByte(9)
      ..write(obj.facilities)
      ..writeByte(10)
      ..write(obj.lastUpdate)
      ..writeByte(11)
      ..write(obj.averse)
      ..writeByte(12)
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
