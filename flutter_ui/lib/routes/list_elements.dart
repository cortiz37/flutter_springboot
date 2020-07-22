import 'package:flutter/material.dart';

class ListElements extends StatelessWidget {
  final AppBar appBar;

  ListElements({this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: this.appBar,
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: 400,
              child: Card(
                child: Text('List'),
              ),
            ),
          ),
        ));
  }
}
