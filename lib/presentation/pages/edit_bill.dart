import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../domain/entites/product.dart';
import '../bloc/edit_bill_bloc.dart';
import '../widgets/form_card.dart';
import '../widgets/platform_scaffold.dart';

class EditBillPage extends StatefulWidget {
  const EditBillPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditBillPageState();
}

class _EditBillPageState extends State<EditBillPage> {
  @override
  Widget build(BuildContext context) {
    final formBloc = context.watch<EditBillBloc>();
    final bill = formBloc.bill;
    return PlatformScaffold(
      actionLabel: "Сохранить",
      actionIcon: Icons.save,
      onTapAction: formBloc.submit,
      title: 'Изменить счет',
      child: FormCard(
        child: FormBlocListener<EditBillBloc, String, String>(
          onSuccess: (context, state) => Navigator.of(context).pop(),
          child: Column(
            children: [
              BillEntry(
                leading: Text('Номер:'),
                body: Text("${bill.number}"),
              ),
              BillEntry(
                leading: Text('Дата: '),
                body: Text(
                    "${DateFormat("yyyy-M-dd HH:mm:ss").format(bill.date)}"),
              ),
              BillEntry(
                leading: Text("Сумма:"),
                body: Text("${bill.total}"),
              ),
              BillEntry(
                flex: 4,
                leading: Text("Статус"),
                body: RadioButtonGroupFieldBlocBuilder(
                  decoration: InputDecoration(border: InputBorder.none),
                  selectFieldBloc: formBloc.status,
                  itemBuilder: (context, value) => value,
                ),
              ),
              BillEntry(
                flex: 4,
                leading: Text("Товары"),
                body: BillProductList(
                  products: bill.products,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BillProductList extends StatelessWidget {
  final List<Product> products;

  const BillProductList({
    Key key,
    this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product.name),
          subtitle: Text(product.sku),
          trailing: Text(product.price.toStringAsFixed(2)),
        );
      });
}

class BillEntry extends StatelessWidget {
  final Widget leading;
  final Widget body;
  final int flex;

  const BillEntry({
    Key key,
    this.leading,
    this.body,
    this.flex = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        flex: flex,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: leading,
                )),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: body,
                )),
          ],
        ),
      );
}
