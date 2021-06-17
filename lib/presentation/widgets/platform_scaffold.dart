import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_widget.dart';

class PlatformScaffold extends PlatformWidget<Scaffold, CupertinoPageScaffold> {
  final Widget child;
  final String title;
  final String actionLabel;
  final IconData actionIcon;
  final VoidCallback onTapAction;

  PlatformScaffold({
    @required this.child,
    @required this.title,
    this.actionLabel = "",
    this.actionIcon,
    this.onTapAction,
  });

  @override
  Scaffold buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white),
        ),
        actions: [
          TextButton.icon(
            icon: Icon(
              actionIcon,
              color: Colors.white,
            ),
            onPressed: onTapAction,
            label: Text(
              actionLabel,
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      body: child,
    );
  }

  @override
  CupertinoPageScaffold buildIOS(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
        trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
      child: child,
    );
  }
}
