import 'package:flutter/material.dart';
import 'package:ltx_deliver/assets/styles.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType {
  login,
  register
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  final TextEditingController _phoneFilter = new TextEditingController();
  final TextEditingController _nameFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  String _name = "";
  String _phone = "";
  FormType _form = FormType.login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _LoginPageState() {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
    if (_form == FormType.login) {
      return Container(
          child: new ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
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
                    controller: _passwordFilter,
                    decoration: new InputDecoration(
                        hintText: 'Пароль'
                    ),
                    obscureText: true,
                  ),
                ),
              )
            ],
          ));
    } else {
      return Container(
          child: new ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                child: new Container(
                  margin: const EdgeInsets.only(top: 16.0),
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
              )
            ],
          ));
    }
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                child: new FlatButton(
                  onPressed: _loginPressed,
                  height: 48,
                  minWidth: double.infinity,
                  child: Text("Войти", style: sButtonLight,),
                  color: brandRGB0[900]),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new FlatButton(
                    child: new Text('Нет аккаунта?'),
                    onPressed: _formChange,
                  ),
                  new FlatButton(
                    child: new Text('Забыли пароль?'),
                    onPressed: _passwordReset,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                child: new FlatButton(
                  onPressed: _createAccountPressed,
                  height: 48,
                  minWidth: double.infinity,
                  child: Text("Создать аккаунт", style: sButtonLight,),
                  color: brandRGB0[900],),
              ),
            ),
            new FlatButton(
              child: new Text('Нажмите, чтобы войти в профиль'),
              onPressed: _formChange,
            )
          ],
        ),
      );
    }
  }

  void _loginPressed () {
    print('The user wants to login with $_email and $_password');
  }

  void _createAccountPressed () {
    print('The user wants to create an accoutn with $_email and $_password');

  }

  void _passwordReset () {
    print("The user wants a password reset request sent to $_email");
  }
  
}