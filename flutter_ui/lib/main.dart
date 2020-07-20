import 'package:flutter/material.dart';
import 'package:flutter_ui/routes/form_elements.dart';
import 'package:flutter_ui/routes/home.dart';
import 'package:flutter_ui/routes/list_elements.dart';

void main() {
  runApp(SimpleApp());
}

class SimpleApp extends StatelessWidget {
  static const ROUTE_HOME = '/home';
  static const ROUTE_LIST = '/list';
  static const ROUTE_FORM = '/form';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Container(),
      routes: {
        ROUTE_HOME: (context) => Home(),
        ROUTE_LIST: (context) => ListElements(),
        ROUTE_FORM: (context) => FormElements(),
      },
    );
  }
}
