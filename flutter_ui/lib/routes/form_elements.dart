import 'package:flutter/material.dart';

class FormElements extends StatefulWidget {
  final AppBar appBar;

  FormElements({this.appBar});

  @override
  _FormElements createState() => _FormElements();
}

class _FormElements extends State<FormElements> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildForm(BuildContext context) {
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
                children: [Text('SAMPLE')],
              ),
            ),
          ),
          Container(
            height: 40,
            width: double.infinity,
            child: FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => {},
              child: Text('Accept'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.appBar,
        backgroundColor: Colors.grey[200],
        body: this._buildForm(context));
  }
}
