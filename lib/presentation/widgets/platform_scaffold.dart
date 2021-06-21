import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_widget.dart';

/// Creates Material [Scaffold] or [CupertinoPageScaffold] with
/// [AppBar] or [CupertinoNavigationBar] depending on platform
class PlatformScaffold extends PlatformWidget<Scaffold, CupertinoPageScaffold> {
  /// Body widget of scaffold
  final Widget child;

  /// Title of scaffold's appbar
  final String title;

  /// Text label of appbar's action
  final String actionLabel;

  /// Icon of appbar's action
  final IconData actionIcon;

  /// Callback for action click
  final VoidCallback onTapAction;

  ///
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
        trailing: TextButton(
          onPressed: onTapAction,
          child: Text(actionLabel),
        ),
      ),
      child: child,
    );
  }
}
