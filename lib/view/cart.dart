import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

import '../res/styles.dart';
import '../res/strings.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.close)),
        title: Text('lol'),
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
