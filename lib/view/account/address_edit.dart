import 'package:flutter/material.dart';

class AddressChangePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddressChangePageState();
}

enum FormType {
  edit,
  create
}

class _AddressChangePageState extends State<AddressChangePage> {

  final TextEditingController _countryFilter = new TextEditingController();
  final TextEditingController _cityFilter = new TextEditingController();
  final TextEditingController _streetFilter = new TextEditingController();
  final TextEditingController _houseFilter = new TextEditingController();
  final TextEditingController _nameFilter = new TextEditingController();
  final TextEditingController _phoneFilter = new TextEditingController();
  String _country = "";
  String _city = "";
  String _street = "";
  String _house = "";
  String _name = "";
  String _phone = "";
  FormType _form = FormType.create; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _AddressChangePageState() {
    _countryFilter.addListener(_countryListen);
    _cityFilter.addListener(_cityListen);
    _streetFilter.addListener(_streetListen);
    _houseFilter.addListener(_houseListen);
    _phoneFilter.addListener(_phoneListen);
    _nameFilter.addListener(_nameListen);
  }

  void _countryListen() {
    if (_countryFilter.text.isEmpty) {
      _country = "";
    } else {
      _country = _countryFilter.text;
    }
  }

  void _cityListen() {
    if (_cityFilter.text.isEmpty) {
      _city = "";
    } else {
      _city = _cityFilter.text;
    }
  }

  void _streetListen() {
    if (_streetFilter.text.isEmpty) {
      _street = "";
    } else {
      _street = _streetFilter.text;
    }
  }

  void _houseListen() {
    if (_houseFilter.text.isEmpty) {
      _house = "";
    } else {
      _house = _houseFilter.text;
    }
  }

  void _phoneListen() {
    if (_phoneFilter.text.isEmpty) {
      _phone = "";
    } else {
      _phone = _phoneFilter.text;
    }
  }

  void _nameListen() {
    if (_nameFilter.text.isEmpty) {
      _name = "";
    } else {
      _name = _nameFilter.text;
    }
  }

  void _formChange () async {
    setState(() {
      if (_form == FormType.edit) {
        _form = FormType.edit;
      } else {
        _form = FormType.create;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Изменить данные"),
      centerTitle: true,
      elevation: 0,
      actions: [
        new IconButton(icon: Icon(Icons.save), onPressed: _savePressed)
      ],

    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _countryFilter,
              decoration: new InputDecoration(
                labelText: 'Область',
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _cityFilter,
              decoration: new InputDecoration(
                  labelText: 'Город'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _streetFilter,
              decoration: new InputDecoration(
                  labelText: 'Улица'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _houseFilter,
              decoration: new InputDecoration(
                  labelText: 'Дом'
              ),
              obscureText: true,
            ),
          ),
          new Container(
            child: new TextField(
              controller: _nameFilter,
              decoration: new InputDecoration(
                  labelText: 'ФИО контактного лицы'
              ),
              obscureText: true,
            ),
          ),
          new Container(
            child: new TextField(
              controller: _phoneFilter,
              decoration: new InputDecoration(
                  labelText: 'Телефон контактного лица'
              ),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  void _savePressed () {
    print("Add new address");
    Navigator.pop(context);
  }

}