import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ltx_deliver/items.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

class AccountOrdersPage extends StatefulWidget {
  AccountOrdersPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AccountOrdersPageState createState() => _AccountOrdersPageState();
}

class _AccountOrdersPageState extends State<AccountOrdersPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_rounded)),
        title: Text('Заказы'),
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Center(
        child: Expanded(
          child: Column(
            children: [
              new Card(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    new Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text("Заказ № 23457-001"),
                        new Text("Доставлен в 23:59 12 декабря 2077 года"),
                        new Divider(),
                        new AddressTextItem(),
                        new ListItemCompact()
                      ],),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
