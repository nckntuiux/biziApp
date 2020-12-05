import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

import '../../assets/styles.dart';
import '../../assets/strings.dart';

class NewOrderPage extends StatefulWidget {
  NewOrderPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.close)),
        title: Text('Создать заказ'),
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },)
          ],
        ),
      ),
    );
  }
}
