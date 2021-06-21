import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../domain/entites/product.dart';
import 'product_list_cubit.dart';

String _requiredFieldValidator(String val) =>
    val.isEmpty ? "Данное поле обязательно для заполнения" : null;

String _numberValidator(String val) {
  try {
    double.parse(val);
  } on FormatException {
    return "Введенный текст не является числом";
  }
  return null;
}

/// Bloc controlling adding product form
class AddProductBloc extends FormBloc<String, String> {
  /// [Product.name]
  final name = TextFieldBloc(
      validators: [_requiredFieldValidator], name: "Наименование");

  /// [Product.sku]
  final sku = TextFieldBloc(
      validators: [_requiredFieldValidator], name: "SKU/код товара");

  /// [Product.price]
  final price = TextFieldBloc(
      validators: [_numberValidator], initialValue: "0", name: "Цена");

  /// Parent cubit controlling list of product
  final ProductListCubit productListCubit;

  ///
  AddProductBloc(this.productListCubit) {
    addFieldBlocs(fieldBlocs: [
      name,
      sku,
      price,
    ]);
  }

  @override
  void onSubmitting() {
    productListCubit.addToList(Product(
      name: name.value,
      sku: sku.value,
      price: price.valueToDouble,
    ));
    print('success');
    emitSuccess();
  }
}
