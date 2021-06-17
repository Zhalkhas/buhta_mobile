import 'package:buhta/presentation/pages/home.dart';
import 'package:buhta/presentation/widgets/willpop_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
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
          // MaterialColor(
          //   0x00c2e2,
          //   {
          //     50: Color.fromRGBO(0x00,0xc2,0xe2, .1),
          //     100: Color.fromRGBO(0x00,0xc2,0xe2, .2),
          //     200: Color.fromRGBO(0x00,0xc2,0xe2, .3),
          //     300: Color.fromRGBO(0x00,0xc2,0xe2, .4),
          //     400: Color.fromRGBO(0x00,0xc2,0xe2, .5),
          //     500: Color.fromRGBO(0x00,0xc2,0xe2, .6),
          //     600: Color.fromRGBO(0x00,0xc2,0xe2, .7),
          //     700: Color.fromRGBO(0x00,0xc2,0xe2, .8),
          //     800: Color.fromRGBO(0x00,0xc2,0xe2, .9),
          //     900: Color.fromRGBO(0x00,0xc2,0xe2, 1),
          //   },
          // ),
          textTheme: GoogleFonts.openSansTextTheme()),
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesome5.person_booth), label: ""),
            ],
            onTap: (value) => setState(() => _index = value),
          ),
          body: IndexedStack(
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
                        ),
                      );
                    default:
                      return MaterialPageRoute(
                          builder: (context) => Container());
                  }
                },
              ),
              Center(
                child: Text("Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  MaterialColor _createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
