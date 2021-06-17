import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_widget.dart';

class PlatformAppBar extends PlatformWidget<AppBar, CupertinoNavigationBar> {
  final String title;

  PlatformAppBar({this.title});

  @override
  AppBar buildAndroid(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  CupertinoNavigationBar buildIOS(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(title),
    );
  }
}
