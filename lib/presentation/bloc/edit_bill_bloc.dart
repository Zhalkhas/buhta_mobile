import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../domain/entites/bill.dart';
import 'bills_list_cubit.dart';

/// Bloc controlling editing bill form
class EditBillBloc extends FormBloc<String, String> {
  /// [Bill.status]
  SelectFieldBloc<String, String> status;

  /// [Bill] which is edited
  final Bill bill;

  /// Parent cubit controlling list of bills
  final BillsListCubit billsListCubit;

  ///
  EditBillBloc({this.bill, this.billsListCubit}) {
    status = SelectFieldBloc(
      items: BillStatus.values.map(billStatusAsString).toList(),
      initialValue: bill.statusString,
    );
    addFieldBloc(fieldBloc: status);
  }

  @override
  void onSubmitting() {
    billsListCubit.editListItem(
      bill.copyWith(
          status: billStatusFromString(
        status.value,
      )),
    );
    billsListCubit.getList();
    emitSuccess();
  }
}
