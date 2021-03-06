import 'package:flutter/material.dart';

/// Card which shows [Bill] or [Product] in list
class ListCard extends StatelessWidget {
  ///
  final String title;

  ///
  final String subtitle;

  ///
  final String subscript;

  ///
  final VoidCallback onTap;

  ///
  final Color color;

  ///
  const ListCard({
    Key key,
    this.title,
    this.subtitle,
    this.subscript,
    this.onTap,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.white),
                ),
                subtitle: Text(
                  subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  subscript,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
