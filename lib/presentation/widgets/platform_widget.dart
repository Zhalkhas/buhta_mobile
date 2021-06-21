import 'dart:io';

import 'package:flutter/material.dart';

/// Widget which builds depending on detected platform
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

  /// Builds Android specific widget
  Android buildAndroid(BuildContext context);

  /// Builds iOS specific widget
  iOS buildIOS(BuildContext context);
}
