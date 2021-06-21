import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../bloc/add_product_bloc.dart';
import '../bloc/product_list_cubit.dart';
import '../widgets/button.dart';
import '../widgets/form_card.dart';
import '../widgets/platform_scaffold.dart';

class AddProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  InputDecoration _textInputDecoration({String label = ""}) => InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
        ),
        labelText: label,
      );

  @override
  Widget build(BuildContext context) {
    final listBloc = context.read<ProductListCubit>();
    return BlocProvider(
      create: (context) => AddProductBloc(listBloc),
      child: PlatformScaffold(
        title: 'Новый товар',
        child: FormCard(
          child: Builder(
            builder: (context) {
              final formBloc = context.read<AddProductBloc>();
              return FormBlocListener<AddProductBloc, String, String>(
                onSuccess: (context, state) {
                  listBloc.getList();
                  Navigator.pop(context);
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFieldBlocBuilder(
                        textFieldBloc: formBloc.name,
                        decoration: _textInputDecoration(label: 'Наименование'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFieldBlocBuilder(
                        textFieldBloc: formBloc.sku,
                        decoration: _textInputDecoration(label: 'SKU'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFieldBlocBuilder(
                        textFieldBloc: formBloc.price,
                        keyboardType: TextInputType.number,
                        decoration: _textInputDecoration(label: 'Цена'),
                      ),
                    ),
                    AppPrimaryButton(
                      title: "Добавить товар",
                      onPressed: formBloc.submit,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
