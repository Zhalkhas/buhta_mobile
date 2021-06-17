import 'dart:io';

import 'package:flutter/cupertino.dart';

abstract class PlatformWidget<Android extends Widget, iOS extends Widget>
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return buildAndroid(context);
    } else if (Platform.isIOS) {
      return buildIOS(context);
    } else {
      throw UnimplementedError();
    }
  }

  Android buildAndroid(BuildContext context);

  iOS buildIOS(BuildContext context);
}
