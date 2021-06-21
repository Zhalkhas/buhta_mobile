import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entites/bill.dart';
import '../bloc/bills_list_cubit.dart';
import '../bloc/edit_bill_bloc.dart';
import '../bloc/list_cubit.dart';
import '../widgets/list_card.dart';
import '../widgets/platform_scaffold.dart';
import 'edit_bill.dart';

/// Scaffold with [Bill]s list
class BillsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: "Счета на оплату",
      child: Builder(
        builder: (context) {
          final state = context.watch<BillsListCubit>().state;
          switch (state.status) {
            case ListStatus.loading:
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            case ListStatus.success:
              final items = List<Bill>.from(state.items);
              return ListView.builder(
                itemBuilder: (context, index) {
                  final bill = items[index];
                  return ListCard(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => EditBillBloc(
                            bill: bill,
                            billsListCubit: context.read<BillsListCubit>(),
                          ),
                          child: EditBillPage(),
                        ),
                      ),
                    ),
                    title: "Cчет ${bill.number}",
                    subtitle: bill.statusString,
                    subscript: "${bill.total.toStringAsFixed(2)} тг",
                  );
                },
                itemCount: items.length,
              );
            case ListStatus.failure:
              return Center(
                child: ListTile(
                  leading: Icon(Icons.error),
                  title: Text(
                    "Error happened, please try again later...",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
