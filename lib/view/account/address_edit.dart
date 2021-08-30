import 'package:flutter/material.dart';
import 'package:ltx_deliver/assets/styles.dart';

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

  PreferredSizeWidget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Изменить данные"),
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: Expanded(
        child: new ListView(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new Container(
                child: new TextField(
                  controller: _countryFilter,
                  decoration: new InputDecoration(
                    hintText: 'Область',
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: new TextField(
                  controller: _cityFilter,
                  decoration: new InputDecoration(
                      hintText: 'Город'
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: new TextField(
                  controller: _streetFilter,
                  decoration: new InputDecoration(
                      hintText: 'Улица'
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: new TextField(
                  controller: _houseFilter,
                  decoration: new InputDecoration(
                      hintText: 'Дом'
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: new TextField(
                  controller: _nameFilter,
                  decoration: new InputDecoration(
                      hintText: 'ФИО контактного лицы'
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                child: Container(
                  child: new MaterialButton(
                    height: 48,
                    minWidth: double.infinity,
                    onPressed: _savePressed,
                    child: Text("Сохранить", style: sButtonLight,),
                    color: brandRGB0[900],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _savePressed () {
    print("Add new address");
    Navigator.pop(context);
  }

}