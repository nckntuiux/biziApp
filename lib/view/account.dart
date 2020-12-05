import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

import '../assets/styles.dart';
import '../assets/strings.dart';
import 'order/address.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  void _onListItemPressed() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddressPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_rounded)),
        title: Text('Аккаунт'),
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Container(
        child: new ListView(children: [
          new TextButton(onPressed: null, child: Text("Мои заказы",),),
          new Divider(),
          new TextButton(onPressed: _onListItemPressed, child: Text("Адреса доставки", style: TextStyle(color: Colors.black),)),
          new Divider(),
          new TextButton(onPressed: null, child: Text("Мои данные"),),
        ]),
        //alignment: AlignmentDirectional.centerStart,
      )
    );
  }
}
