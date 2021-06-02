import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ltx_deliver/assets/styles.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                 Container(
                   child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Text("Заказ № 23457-001", style: sAltOrder,),
                          new Text("Доставлен в 23:59 12 декабря 2077 года", style: sAltOrder,),
                          new Divider(color: colorWhite,),
                          new AddressTextItem(),
                          new Divider(),
                          new ListItemCompact(),
                          new ListItemCompact()
                        ],),
                    ),
                ),
                 ),
              ],
            ),
          ),
      ),
      );
    }
}
