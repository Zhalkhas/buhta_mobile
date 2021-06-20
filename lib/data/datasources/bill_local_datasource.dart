import 'package:hive/hive.dart';

import '../models/bill_model.dart';
import '../models/product_model.dart';

final _mockProducts = [
  ProductModel(
    id: "0",
    name: "Йогурт Frutis",
    price: 350,
    sku: "112345235",
  ),
  ProductModel(
    id: "1",
    name: "USB кабель Type-C",
    price: 570,
    sku: "112345978",
  ),
  ProductModel(
    id: "2",
    name: "Ручка шариковая",
    price: 50,
    sku: "456457457",
  ),
];
final _mockData = [
  BillModel(
    id: "1",
    date: DateTime(2021, 7, 13),
    number: 123123,
    products: _mockProducts,
    status: BillModelStatus.canceled,
  ),
  BillModel(
    id: "2",
    date: DateTime(2021, 7, 13),
    number: 123312,
    products: _mockProducts,
    status: BillModelStatus.paymentSuccess,
  ),
  BillModel(
    id: "3",
    date: DateTime(2021, 7, 13),
    number: 233312,
    products: _mockProducts,
    status: BillModelStatus.waitingPayment,
  ),
];

/// Class manages access to [BillModel] instances
/// stored in local [Hive] db
class BillLocalDataSource {
  final _billsBoxName = 'bill-box';

  /// Gets all available [BillModel] objects in db
  Future<List<BillModel>> getAllModels() async {
    final box = await Hive.openBox(_billsBoxName);
    final values = box.values;
    if (values.isEmpty) {
      await box.putAll(
        _mockData.asMap().map(
              (key, value) => MapEntry(value.id, value),
            ),
      );
      return _mockData;
    }
    final res = List<BillModel>.from(box.values);
    return res;
  }

  /// Rewrites [BillModel.status] in database
  Future editBillStatus(String id, BillModelStatus newStatus) async {
    final box = await Hive.openBox(_billsBoxName);
    final bill = box.get(id) as BillModel;
    box.put(id, bill.copyWith(status: newStatus));
  }
}
