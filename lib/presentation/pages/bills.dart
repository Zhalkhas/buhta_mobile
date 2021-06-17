import 'package:flutter/material.dart';

import '../widgets/list_card.dart';
import '../widgets/platform_scaffold.dart';

class BillsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: "Счета на оплату",
      child: ListView(
        children: List.generate(
          5,
          (index) => ListCard(
            onTap: () {},
            title: "Cчет номер $index",
            subtitle: "24/10/21",
            subscript: "33003 Т",
          ),
        ),
      ),
    );
  }
}
