import 'package:flutter/material.dart';

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
  final TextEditingController _phoneFilter = new TextEditingController();
  final TextEditingController _nameFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  String _name = "";
  String _phone = "";
  FormType _form = FormType.login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _LoginChangePageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
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
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Войти в аккаунт"),
      centerTitle: true,
      elevation: 0,
      
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: new InputDecoration(
                  labelText: 'Email'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _phoneFilter,
              decoration: new InputDecoration(
                  labelText: 'Номер Телефона'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _nameFilter,
              decoration: new InputDecoration(
                  labelText: 'Имя'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(
                  labelText: 'Пароль'
              ),
              obscureText: true,
            ),
          ),
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(
                  labelText: ' Повторить пароль'
              ),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            child: new Text('Выйти'),
            onPressed: _unloginPressed,
          ),
        ],
      ),
    );
  }

  void _unloginPressed () {
    print('The user wants to unlogin with $_email and $_password');
  }

  

}