// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartshowModelAdapter extends TypeAdapter<CartshowModel> {
  @override
  final int typeId = 0;

  @override
  CartshowModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartshowModel();
  }

  @override
  void write(BinaryWriter writer, CartshowModel obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartshowModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CartsAdapter extends TypeAdapter<Carts> {
  @override
  final int typeId = 1;

  @override
  Carts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Carts(
      id: fields[0] as int?,
      menuId: fields[1] as int?,
      customerId: fields[2] as String?,
      partnerId: fields[3] as int?,
      quantity: fields[4] as int?,
      menuName: fields[5] as String?,
      menuImage: fields[6] as dynamic,
      menuPrice: fields[7] as int?,
      uploadedFrom: fields[8] as String?,
      size: fields[9] as String?,
      createdAt: fields[10] as DateTime?,
      updatedAt: fields[11] as DateTime?,
      hotelName: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Carts obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.menuId)
      ..writeByte(2)
      ..write(obj.customerId)
      ..writeByte(3)
      ..write(obj.partnerId)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.menuName)
      ..writeByte(6)
      ..write(obj.menuImage)
      ..writeByte(7)
      ..write(obj.menuPrice)
      ..writeByte(8)
      ..write(obj.uploadedFrom)
      ..writeByte(9)
      ..write(obj.size)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.updatedAt)
      ..writeByte(12)
      ..write(obj.hotelName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
