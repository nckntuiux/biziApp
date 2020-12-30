import 'package:flutter/material.dart';
import 'package:ltx_deliver/assets/styles.dart';

class LoginChangePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginChangePageState();
}

enum FormType {
  login,
  register
}

class _LoginChangePageState extends State<LoginChangePage> {

  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  final TextEditingController _passwordRepeatFilter = new TextEditingController();
  final TextEditingController _phoneFilter = new TextEditingController();
  final TextEditingController _nameFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  String _passwordRepeat = "";
  String _name = "";
  String _phone = "";
  FormType _form = FormType.login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _LoginChangePageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
    _passwordRepeatFilter.addListener(_passwordRepeatListen);
    _phoneFilter.addListener(_phoneListen);
    _nameFilter.addListener(_nameListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  void _passwordRepeatListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
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
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
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
                  controller: _emailFilter,
                  decoration: new InputDecoration(
                    hintText: 'Email',
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: new TextField(
                  controller: _phoneFilter,
                  decoration: new InputDecoration(
                      hintText: 'Номер Телефона'
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
                      hintText: 'Имя'
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: new TextField(
                  controller: _passwordFilter,
                  decoration: new InputDecoration(
                      hintText: 'Пароль'
                  ),
                  obscureText: true,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: new Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: new TextField(
                  controller: _passwordRepeatFilter,
                  decoration: new InputDecoration(
                      hintText: ' Повторить пароль'
                  ),
                  obscureText: true,
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
    print('The user wants to save credentials with $_email and $_password');
    Navigator.pop(context);
  }

  

}