import 'package:flutter/material.dart';

class StandardCard extends StatelessWidget {
  final String text;

  StandardCard(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.error_outline, size: 16, color: Colors.red),
            SizedBox(height: 30),
            Text(this.text, style: Theme.of(context).textTheme.subtitle1),
          ],
        ),
      ),
    );
  }
}
