import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'product_model.dart';

part 'bill_model.freezed.dart';

part 'bill_model.g.dart';

@HiveType(typeId: 2, adapterName: 'BillModelStatusAdapter')

/// Define whether [BillModel] is payed or not
enum BillModelStatus {
  @HiveField(0)
  canceled,
  @HiveField(1)
  waitingPayment,
  @HiveField(2)
  paymentSuccess,
}

/// [BillModel] is representation of [Bill] entity in db
@freezed
abstract class BillModel with _$BillModel {
  ///
  @HiveType(typeId: 1, adapterName: 'BillModelAdapter')
  factory BillModel({
    @HiveField(0) String id,
    @HiveField(1) int number,
    @HiveField(2) DateTime date,
    @HiveField(3) List<ProductModel> products,
    @HiveField(4) BillModelStatus status,
  }) = _BillModel;

  /// Returns total price for bill
  @late
  double get total => products.fold(
      0, (previousValue, element) => previousValue + element.price);
}
