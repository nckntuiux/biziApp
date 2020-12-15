import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ltx_deliver/assets/styles.dart';
import 'package:ltx_deliver/view/account/account_edit.dart';
import 'package:ltx_deliver/view/launch/login.dart';
import 'package:ltx_deliver/view/order/account_orders.dart';
import 'package:ltx_deliver/items.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  void _onActionLoginItemPressed() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_rounded)),
          title: Text('Поиск', style: sAppBarText,),
          elevation: 0,
          brightness: Brightness.light,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),

              ),
            ),
          ),
        ),
        body: Container(
          child: new ListView(children: [
            new ListItem(),
            new Divider(color: Colors.white,),
            new ListItem(),
        ]),
    ));
  }

}
