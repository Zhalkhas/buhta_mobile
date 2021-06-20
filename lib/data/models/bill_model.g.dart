// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BillModelStatusAdapter extends TypeAdapter<BillModelStatus> {
  @override
  final int typeId = 2;

  @override
  BillModelStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BillModelStatus.canceled;
      case 1:
        return BillModelStatus.waitingPayment;
      case 2:
        return BillModelStatus.paymentSuccess;
      default:
        return BillModelStatus.canceled;
    }
  }

  @override
  void write(BinaryWriter writer, BillModelStatus obj) {
    switch (obj) {
      case BillModelStatus.canceled:
        writer.writeByte(0);
        break;
      case BillModelStatus.waitingPayment:
        writer.writeByte(1);
        break;
      case BillModelStatus.paymentSuccess:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillModelStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BillModelAdapter extends TypeAdapter<_$_BillModel> {
  @override
  final int typeId = 1;

  @override
  _$_BillModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_BillModel(
      id: fields[0] as String,
      number: fields[1] as int,
      date: fields[2] as DateTime,
      products: (fields[3] as List)?.cast<ProductModel>(),
      status: fields[4] as BillModelStatus,
    );
  }

  @override
  void write(BinaryWriter writer, _$_BillModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.products)
      ..writeByte(4)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
