import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ltx_deliver/view/launch/login.dart';
import 'package:ltx_deliver/items.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

import '../assets/styles.dart';
import '../assets/strings.dart';
import 'order/order_new.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void _onButtonPressed() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewOrderPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.close)),
        title: Text('Корзина', style: sAppBarText,),
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                new Container(
                  child: Expanded(
                    child: ListView(children: [
                      new ListItem(),
                      new Divider(color: Colors.white,),
                      new ListItem(),
                    ]),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  child: new FlatButton(
                    onPressed: _onButtonPressed,
                    height: 48,
                    minWidth: double.infinity,
                    child: Text("Оформить заказ на ХХХ руб.", style: sButton,),
                    color: Colors.amber,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
