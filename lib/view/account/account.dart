import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ltx_deliver/view/account/account_edit.dart';
import 'package:ltx_deliver/view/order/account_orders.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

import '../../assets/styles.dart';
import '../../assets/strings.dart';
import '../order/address.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_rounded)),
        title: Text('Аккаунт', style: sAppBar,),
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Container(
        child: new ListView(children: [
          new Column(children: [
            new Text("Николай Благовестный"),
            new Text("+7 (999) 999-99-99"),
          ],),
          new Divider(),
          new TextButton(onPressed: _onOrdersItemPressed, child: Text("Мои заказы", style: TextStyle(color: Colors.black)),),
          new Divider(),
          new TextButton(onPressed: _onDeliveryItemPressed, child: Text("Адреса доставки", style: TextStyle(color: Colors.black),)),
          new Divider(),
          new TextButton(onPressed: _onAccountItemPressed, child: Text("Изменить данные", style: TextStyle(color: Colors.black)),),
          new Divider(),
          new TextButton(onPressed: _onLogoutItemPressed, child: Text("Выйти из аккаунта", style: TextStyle(color: Colors.black)),),
        ]),
        //alignment: AlignmentDirectional.centerStart,
      )
    );
  }

  void _onOrdersItemPressed() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountOrdersPage()),
      );
    });
  }

  void _onDeliveryItemPressed() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddressPage()),
      );
    });
  }

  void _onAccountItemPressed() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginChangePage()),
      );
    });
  }

  void _onLogoutItemPressed() {

  }
}
