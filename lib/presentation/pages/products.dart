import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entites/product.dart';
import '../bloc/list_cubit.dart';
import '../bloc/product_list_cubit.dart';
import '../widgets/list_card.dart';
import '../widgets/platform_scaffold.dart';
import '../widgets/willpop_wrapper.dart';
import 'add_product.dart';

/// Widget representing [Product] cards list
class ProductsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductListCubit>().state;
    switch (state.status) {
      case ListStatus.loading:
        return Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          ),
        );
        break;
      case ListStatus.success:
        final items = List<Product>.from(state.items);
        return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final product = items[index];
              return ListCard(
                subscript: '${items[index].price.toStringAsFixed(2)} тг',
                title: product.name,
                subtitle: "SKU: ${product.sku}",
                onTap: () {},
              );
            });
        break;
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
        break;
      default:
        return Container();
    }
  }
}

/// Scaffold with [Product]s list
class ProductsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopWrapper(
      child: PlatformScaffold(
        title: "Товары и услуги",
        child: ProductsListWidget(),
        actionIcon: Icons.add,
        actionLabel: "Добавить",
        onTapAction: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddProductPage(),
          ),
        ),
      ),
    );
  }
}
