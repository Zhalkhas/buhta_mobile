import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// [ElevatedButton] stylised for app's theme
class AppPrimaryButton extends StatelessWidget {
  /// Text on button
  final String title;

  ///
  final VoidCallback onPressed;

  ///
  const AppPrimaryButton({Key key, this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: Color.fromRGBO(0x0d, 0xc3, 0xac, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            title,
            style: GoogleFonts.openSans(
              color: Colors.white,
              textStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      );
}
