import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:ltx_deliver/view/account/account_edit.dart';
import 'package:ltx_deliver/view/order/account_orders.dart';

import '../../assets/styles.dart';
import '../../assets/strings.dart';
import 'address.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(SFSymbols.chevron_left)),
        //title: Text('Аккаунт', style: sAppBarText,),
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Container(
        child: new ListView(children: [
          new Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text("Николай Благовестный", style: sHeadingAccount, maxLines: 2,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text("+7 (999) 999-99-99", style: sAltFinish,),
            ),
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
