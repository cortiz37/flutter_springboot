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

  final inputPadding = EdgeInsets.fromLTRB(8, 4, 8, 4);

  void _save() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    print("SAVING...");
  }

  String _required(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  Widget _buildForm(BuildContext context) {
    var controls = [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: inputPadding,
            hintText: 'Name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          ),
          validator: this._required,
          textInputAction: TextInputAction.next,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: inputPadding,
            hintText: 'Description',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          ),
          validator: this._required,
          textInputAction: TextInputAction.next,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: inputPadding,
            hintText: 'Amount',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          ),
          validator: this._required,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
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
                  onPressed: () => this._save(),
                  child: Text('Accept'),
                ),
                SizedBox(width: 10),
                FlatButton(
                    color: Colors.white,
                    textColor: Colors.blue,
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(ROUTE_LIST, (_) => false);
                    },
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
