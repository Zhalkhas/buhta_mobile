import '../../core/usecases/usecase.dart';
import '../../domain/entites/bill.dart';
import '../../domain/usecases/edit_bill.dart';
import '../../domain/usecases/get_all_bills.dart';
import 'list_cubit.dart';

/// Cubit controlling UI for [Bill]s list
class BillsListCubit extends ListCubit<Bill> {
  /// [EditBill] usecase instance
  final EditBill editBill;

  /// [GetAllBills] usecase instance
  final GetAllBills getAllBills;

  ///
  BillsListCubit(this.editBill, this.getAllBills);

  @override
  Future addToList(Bill item) {
    // TODO: implement addToList
    throw UnimplementedError();
  }

  @override
  Future deleteFromList(Bill item) {
    // TODO: implement deleteFromList
    throw UnimplementedError();
  }

  @override
  Future editListItem(Bill item) async {
    final failure = await editBill(
      EditBillParams(item),
    ).then(
      (value) => getList(),
    );
    if (failure != null) {
      emit(ListState.failure());
    }
  }

  @override
  Future getList() => getAllBills(NoParams()).then(
        (res) => res.fold(
          (l) => emit(ListState.failure()),
          (r) => emit(ListState.success(r)),
        ),
      );
}
