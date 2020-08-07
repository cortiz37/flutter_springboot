import 'package:flutter/material.dart';
import 'package:flutter_ui/main.dart';

class FormElements extends StatefulWidget {
  final StandardAppBar appBar;

  FormElements({this.appBar});

  @override
  _FormElements createState() => _FormElements();
}

class _FormElements extends State<FormElements> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildForm(BuildContext context) {
    var controls = [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Description',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ),
    ];

    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controls,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () => {},
                  child: Text('Accept'),
                ),
                SizedBox(width: 10),
                FlatButton(
                    color: Colors.white,
                    textColor: Colors.blue,
                    onPressed: () => {},
                    child: Text('Cancel'),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.blue,
                          width: 1,
                          style: BorderStyle.solid),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: widget.appBar, body: this._buildForm(context));
  }
}
