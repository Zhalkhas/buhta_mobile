import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../widgets/title_card.dart';
import 'bills.dart';
import 'products.dart';

/// Home tab of the application
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TitleCard(
              title: 'Товары и услуги',
              color: Colors.red,
              leadingIcon: FontAwesome5.list_ul,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductsListPage(),
                ),
              ),
            ),
            TitleCard(
              title: 'Счета на оплату',
              color: Color.fromRGBO(0, 0xc2, 0xe2, 1),
              leadingIcon: FontAwesome5.file_invoice_dollar,
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BillsListPage(),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
