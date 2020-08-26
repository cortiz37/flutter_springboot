import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/client/element_service.dart';
import 'package:flutter_ui/component/BottomBar.dart';
import 'package:flutter_ui/domain/element_entity.dart';
import 'package:flutter_ui/main.dart';

class ListElements extends StatefulWidget {
  final StandardAppBar appBar;

  ListElements({this.appBar});

  @override
  _ListElements createState() => _ListElements();
}

class _ListElements extends State<ListElements> {
  Widget _asListView(List<ElementEntity> elements) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(thickness: 1);
      },
      addAutomaticKeepAlives: true,
      scrollDirection: Axis.vertical,
      itemCount: elements.length,
      itemBuilder: (BuildContext context, int index) {
        ElementEntity element = elements[index];
        return Dismissible(
          direction: DismissDirection.startToEnd,
          key: Key(index.toString()),
          background: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red[400], Colors.white],
                  tileMode: TileMode.clamp),
            ),
          ),
          onDismissed: (direction) async {
            if (await elementService.deleteElement(element.id)) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("Element deleted")));
              setState(() {
                elements.removeAt(index);
              });
            } else {
              setState(() {});
            }
          },
          child: ListTile(
            leading: element.success
                ? Icon(Icons.label_important)
                : Icon(Icons.label_outline),
            title: Text(element.name),
            subtitle: Text(element.description),
            trailing: Chip(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: BorderSide(color: Colors.grey, width: 1)),
              label: Text(element.amount.toString()),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      bottomNavigationBar: BottomBar('Element list'),
      body: Container(
        child: FutureBuilder<List<ElementEntity>>(
          future: elementService.getElements(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ElementEntity>> snapshot) {
            if (snapshot.hasData) {
              List data = snapshot.data;
              return data.isNotEmpty
                  ? this._asListView(data)
                  : Center(
                      child: Text(
                      'No data',
                      style: Theme.of(context).textTheme.headline5,
                    ));
            } else if (snapshot.hasError) {
              return Text('Error loading elements: ${snapshot.error}');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .pushNamedAndRemoveUntil(ROUTE_FORM, (_) => false),
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
