import 'package:flutter/material.dart';
import 'package:flutter_ui/routes/form_elements.dart';
import 'package:flutter_ui/routes/list_elements.dart';

void main() {
  runApp(SimpleApp());
}

class SimpleApp extends StatelessWidget {
  static const ROUTE_LIST = '/list';
  static const ROUTE_FORM = '/form';
  static const APP_NAME = 'Simple Flutter App';

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar(
      automaticallyImplyLeading: true,
      leading: IconButton(
        icon: Icon(Icons.home),
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(ROUTE_LIST, (_) => false);
        },
      ),
      title: Text(APP_NAME),
    );

    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ListElements(appBar: appbar),
      routes: {
        ROUTE_LIST: (context) => ListElements(appBar: appbar),
        ROUTE_FORM: (context) => FormElements(appBar: appbar),
      },
    );
  }
}
