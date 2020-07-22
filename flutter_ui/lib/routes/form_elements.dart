import 'package:flutter/material.dart';

class FormElements extends StatelessWidget {
  final AppBar appBar;

  FormElements({this.appBar});

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
                child: Text('Form'),
              ),
            ),
          ),
        ));
  }
}
