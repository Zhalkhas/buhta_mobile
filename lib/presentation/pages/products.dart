import 'package:flutter/material.dart';

import '../widgets/list_card.dart';
import '../widgets/platform_scaffold.dart';

class ProductsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: "Товары и услуги",
      child: ListView(
        children: List.generate(
          5,
          (index) => ListCard(
            onTap: () {},
            title: "Товар номер $index",
            subtitle: "тут должен быть sku",
            subscript: "33003 Т",
          ),
        ),
      ),
      actionIcon: Icons.add,
      actionLabel: "Добавить",
      onTapAction: () {},
    );
  }
}
