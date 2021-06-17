import 'package:buhta/presentation/pages/bills.dart';
import 'package:buhta/presentation/pages/products.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';

import '../widgets/title_card.dart';

///Widget containing all
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
              leadingIcon: Fontelico.emo_angry,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductsListPage(),
                ),
              ),
            ),
            TitleCard(
              title: 'Счета на оплату',
              color: Color.fromRGBO(0, 0xc2, 0xe2, 1),
              leadingIcon: FontAwesome5.money_bill,
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
