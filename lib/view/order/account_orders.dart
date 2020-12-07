import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
