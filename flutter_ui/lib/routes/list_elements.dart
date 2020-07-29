import 'package:flutter/material.dart';
import 'package:flutter_ui/client/element_service.dart';

class ListElements extends StatelessWidget {
  final AppBar appBar;

  ListElements({this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: this.appBar,
        body: Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder<Iterable>(
            future: elementService.getElements(),
            builder: (BuildContext context, AsyncSnapshot<Iterable> snapshot) {
              if (snapshot.hasData) {
                var elements = List.of(snapshot.data);
                return Text('Elements loaded! ${elements.length} total');
              } else if (snapshot.hasError) {
                return Text('Error loading elements: ${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }
}
