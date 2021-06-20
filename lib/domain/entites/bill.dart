import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/bill_model.dart';
import 'product.dart';

part 'bill.freezed.dart';

/// Define whether [Bill] is payed or not
enum BillStatus {
  canceled,
  waitingPayment,
  paymentSuccess,
}

/// Converts [BillStatus] to its string representation in UI
String billStatusAsString(BillStatus status) {
  switch (status) {
    case BillStatus.canceled:
      return "Отменен";
      break;
    case BillStatus.waitingPayment:
      return "Ожидается оплата";
      break;
    case BillStatus.paymentSuccess:
      return "Оплачено";
    default:
      return "";
  }
}

/// Converts string from UI to [BillStatus]
BillStatus billStatusFromString(String val) {
  switch (val) {
    case "Отменен":
      return BillStatus.canceled;
    case "Ожидается оплата":
      return BillStatus.waitingPayment;
    case "Оплачено":
      return BillStatus.paymentSuccess;
    default:
      throw Exception('No such BillStatus');
      break;
  }
}

///
@freezed
abstract class Bill with _$Bill {
  ///
  factory Bill({
    String id,
    int number,
    DateTime date,
    List<Product> products,
    BillStatus status,
  }) = _Bill;

  @late

  /// Returns total price of products
  double get total => products.fold(
      0, (previousValue, element) => previousValue + element.price);

  @late

  /// Gives string representation of [status]
  //UI in entity???
  String get statusString => billStatusAsString(status);

  /// Create new entity from representation
  /// in db, [BillModel]
  factory Bill.fromModel(BillModel model) => Bill(
        id: model.id,
        products: model.products.map((e) => Product.fromModel(e)).toList(),
        status: _modelStatusToStatus(model.status),
        number: model.number,
        date: model.date,
      );
}

BillStatus _modelStatusToStatus(BillModelStatus status) {
  switch (status) {
    case BillModelStatus.canceled:
      return BillStatus.canceled;
    case BillModelStatus.waitingPayment:
      return BillStatus.waitingPayment;
    case BillModelStatus.paymentSuccess:
      return BillStatus.paymentSuccess;
    default:
      throw Exception('No such enum');
  }
}
