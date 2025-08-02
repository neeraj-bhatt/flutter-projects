// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_cart_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCartItemAdapter extends TypeAdapter<HiveCartItem> {
  @override
  final int typeId = 0;

  @override
  HiveCartItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCartItem(
      productId: fields[0] as int,
      title: fields[1] as String,
      description: fields[2] as String,
      image: fields[3] as String,
      price: fields[4] as num,
      quantity: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCartItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCartItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
