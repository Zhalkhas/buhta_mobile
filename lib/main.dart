import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/datasources/bill_local_datasource.dart';
import 'data/datasources/product_local_datasource.dart';
import 'data/models/bill_model.dart';
import 'data/models/product_model.dart';
import 'data/repos/bill_repo_impl.dart';
import 'data/repos/product_repo_impl.dart';
import 'domain/usecases/add_new_product.dart';
import 'domain/usecases/edit_bill.dart';
import 'domain/usecases/get_all_bills.dart';
import 'domain/usecases/get_all_products.dart';
import 'presentation/bloc/bills_list_cubit.dart';
import 'presentation/bloc/product_list_cubit.dart';
import 'presentation/pages/home.dart';
import 'presentation/widgets/willpop_wrapper.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(BillModelAdapter());
  Hive.registerAdapter(BillModelStatusAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buhta Mobile',
      theme: ThemeData(
          primarySwatch: _createMaterialColor(
            Color.fromRGBO(0x00, 0xc2, 0xe2, 1),
          ),
          textTheme: GoogleFonts.openSansTextTheme()),
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 5,
            currentIndex: _index,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Главная"),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesome5.user_circle), label: "Профиль"),
            ],
            onTap: (value) => setState(() => _index = value),
          ),
          body: Builder(
            builder: (context) {
              final productRepo =
                  ProductRepositoryImpl(ProductLocalDataSource());
              final billsRepo = BillsRepositoryImpl(BillLocalDataSource());
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => ProductListCubit(
                      GetAllProducts(productRepo),
                      AddNewProduct(productRepo),
                    )..getList(),
                  ),
                  BlocProvider(
                    create: (context) => BillsListCubit(
                      EditBill(billsRepo),
                      GetAllBills(billsRepo),
                    )..getList(),
                  )
                ],
                child: IndexedStack(
                  index: _index,
                  children: [
                    Navigator(
                      initialRoute: '/home',
                      onGenerateRoute: (settings) {
                        switch (settings.name) {
                          case '/home':
                            return MaterialPageRoute(
                                builder: (context) => WillPopWrapper(
                                      child: HomePage(),
                                    ));
                          default:
                            return MaterialPageRoute(
                                builder: (context) => Container());
                        }
                      },
                    ),
                    Center(
                      child: ListTile(
                        leading: Icon(Icons.construction),
                        title: Text(
                          "Under construction, come back later...",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
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

  MaterialColor _createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final r = color.red, g = color.green, b = color.blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}
