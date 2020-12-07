import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

class AccountInfoPage extends StatefulWidget {
  AccountInfoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AccountInfoPageState createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_rounded)),
        title: Text('Имя клиента'),
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
