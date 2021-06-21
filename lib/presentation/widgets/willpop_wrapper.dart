import 'package:flutter/cupertino.dart';

/// Widget catches back button press and overrides it
/// Needed for problem with nested navigation,
/// when back button press exits app
class WillPopWrapper extends StatelessWidget {
  /// Widget which is wrapped
  final Widget child;

  /// Global ket of child navigator
  final GlobalKey<NavigatorState> navKey;

  ///
  const WillPopWrapper({Key key, this.child, this.navKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: child,
        onWillPop: () async {
          print('willpop wrapper');
          Navigator.of(context).pop();
          // await navKey.currentState.maybePop();
          return false;
        });
  }
}
