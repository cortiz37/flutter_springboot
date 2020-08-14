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

  final FocusNode _focusName = new FocusNode();
  final FocusNode _focusDescription = new FocusNode();
  final FocusNode _focusAmount = new FocusNode();
  final FocusNode _focusSuccess = new FocusNode();

  Map element = {
    'name': '',
    'description': '',
    'amount': 0,
    'success': true,
  };

  void _save() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    print(element);
  }

  String _required(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String _integer(String value) {
    final _required = this._required(value);
    if (_required == null) {
      return int.tryParse(value) == null ? 'Should it be an integer' : null;
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
          focusNode: _focusName,
          onChanged: (value) {
            element['name'] = value;
          },
          onFieldSubmitted: (term) {
            _focusName.unfocus();
            FocusScope.of(context).requestFocus(_focusDescription);
          },
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
          focusNode: _focusDescription,
          onChanged: (value) {
            element['description'] = value;
          },
          onFieldSubmitted: (term) {
            _focusDescription.unfocus();
            FocusScope.of(context).requestFocus(_focusAmount);
          },
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
          validator: this._integer,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
          focusNode: _focusAmount,
          onChanged: (value) {
            element['amount'] = int.tryParse(value);
          },
          onFieldSubmitted: (term) {
            _focusAmount.unfocus();
            FocusScope.of(context).requestFocus(_focusSuccess);
          },
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text('Successful element'),
            SizedBox(width: 10),
            Switch(
              value: element['success'],
              onChanged: (value) {
                setState(() {
                  element['success'] = value;
                });
              },
              focusNode: _focusSuccess,
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Divider(),
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
            padding: EdgeInsets.only(right: 10),
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
