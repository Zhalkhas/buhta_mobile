import 'package:flutter/material.dart';

/// Card for placing forms
class FormCard extends StatelessWidget {
  /// The form itself
  final Widget child;

  ///
  const FormCard({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Card(child: child),
      );
}
