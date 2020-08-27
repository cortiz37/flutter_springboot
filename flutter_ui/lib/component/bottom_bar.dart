import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final String text;

  BottomBar(this.text);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      shape: CircularNotchedRectangle(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          this.text,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
