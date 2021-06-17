import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;
  final IconData leadingIcon;

  const TitleCard({
    Key key,
    @required this.title,
    @required this.color,
    @required this.leadingIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.zero,
        ),
        child: Center(
          child: ListTile(
            //TODO: fix splash effect
            onTap: onTap,
            leading: Icon(
              leadingIcon,
              color: Colors.white,
              size: 50,
            ),
            title: Text(
              title,
              textAlign: TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
