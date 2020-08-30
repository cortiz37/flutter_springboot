import 'package:flutter/material.dart';

class StandardCard extends StatelessWidget {
  final String text;
  final bool info;

  StandardCard(this.text, {this.info = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Divider(),
            SizedBox(height: 15),
            Icon(
              this.info ? Icons.info_outline : Icons.error_outline,
              size: 40,
              color: this.info ? Colors.blue : Colors.red,
            ),
            SizedBox(height: 30),
            Text(this.text, style: Theme.of(context).textTheme.subtitle1),
            SizedBox(height: 15),
            Divider(),
          ],
        ),
      ),
    );
  }
}
