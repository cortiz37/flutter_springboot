import 'package:flutter/material.dart';
import 'package:flutter_ui/routes/form_elements.dart';
import 'package:flutter_ui/routes/list_elements.dart';

void main() {
  runApp(SimpleApp());
}

const APP_NAME = 'Simple Flutter App';
const ROUTE_LIST = '/list';
const ROUTE_FORM = '/form';

class SimpleApp extends StatelessWidget {
  final StandardAppBar appBar = StandardAppBar();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ListElements(appBar: appBar),
      routes: {
        ROUTE_LIST: (context) => ListElements(appBar: appBar),
        ROUTE_FORM: (context) => FormElements(appBar: appBar),
      },
    );
  }
}

class StandardAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
