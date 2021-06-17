import 'package:flutter/cupertino.dart';

class WillPopWrapper extends StatelessWidget {
  final Widget child;
  final GlobalKey<NavigatorState> navKey;

  const WillPopWrapper({Key key, this.child, this.navKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: child,
        onWillPop: () async {
          await navKey.currentState.maybePop();
          return false;
        });
  }
}
