import 'package:flutter/material.dart';
import 'package:flutter_ui/client/element_service.dart';
import 'package:flutter_ui/main.dart';

class ListElements extends StatelessWidget {
  final AppBar appBar;

  ListElements({this.appBar});

  Widget _asListView(List elements) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(thickness: 1);
      },
      addAutomaticKeepAlives: true,
      scrollDirection: Axis.vertical,
      itemCount: elements.length,
      itemBuilder: (BuildContext context, int index) {
        var element = elements[index];
        return ListTile(
          leading: element['success']
              ? Icon(Icons.label_important)
              : Icon(Icons.label_outline),
          title: Text(element['name']),
          subtitle: Text(element['description']),
          trailing: Chip(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(color: Colors.grey, width: 1)),
            label: Text(element['amount'].toString()),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.appBar,
      body: Container(
        //padding: EdgeInsets.all(10),
        child: FutureBuilder<Iterable>(
          future: elementService.getElements(),
          builder: (BuildContext context, AsyncSnapshot<Iterable> snapshot) {
            if (snapshot.hasData) {
              return this._asListView(List.of(snapshot.data));
            } else if (snapshot.hasError) {
              return Text('Error loading elements: ${snapshot.error}');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .pushNamedAndRemoveUntil(SimpleApp.ROUTE_FORM, (_) => false),
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
