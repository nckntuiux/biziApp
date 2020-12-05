import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        title: Text('Корзина'),
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              new Container(
                child: Expanded(
                  child: ListView(children: [
                    new Row(
                      children: [
                        new Container(
                            width: 81,
                            height: 81,
                            padding: EdgeInsets.only(right: 15),
                            //margin: EdgeInsets.only(right: 15),
                            child: Image(image: AssetImage('res_fake/fakecontent.jpeg'))),
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Text("2499 ₽ | Полутороспальный (1.5)",),
                            new Text("Сатин Люкс+"),
                            new Row(
                              children: [
                                new Container(
                                  child: new MaterialButton(
                                    onPressed: null,
                                    child: Text("+"),
                                    minWidth: 20,
                                    elevation: 0,

                                    color: Colors.grey[200],
                                  ),
                                  margin: EdgeInsets.only(left: 4.0),
                                ),
                                new Container(
                                  child: new Text("5"),
                                  margin: EdgeInsets.only(left: 4.0),
                                ),
                                new Container(
                                  child: new MaterialButton(
                                    onPressed: null,
                                    child: Text("-"),
                                    minWidth: 20,
                                    elevation: 0,

                                    color: Colors.grey[200],
                                  ),
                                  margin: EdgeInsets.only(left: 4.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    new Divider(),
                    new Row(
                      children: [
                        new Container(
                            width: 81,
                            height: 81,
                            padding: EdgeInsets.only(right: 15),
                            //margin: EdgeInsets.only(right: 15),
                            child: Image(image: AssetImage('res_fake/fakecontent.jpeg'))),
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Text("2499 ₽ | Полутороспальный (1.5)",),
                            new Text("Сатин Люкс+"),
                            new Row(
                              children: [
                                new Container(
                                  child: new MaterialButton(
                                    onPressed: null,
                                    child: Text("+"),
                                    minWidth: 20,
                                    elevation: 0,

                                    color: Colors.grey[200],
                                  ),
                                  margin: EdgeInsets.only(left: 4.0),
                                ),
                                new Container(
                                  child: new Text("5"),
                                  margin: EdgeInsets.only(left: 4.0),
                                ),
                                new Container(
                                  child: new MaterialButton(
                                    onPressed: null,
                                    child: Text("-"),
                                    minWidth: 20,
                                    elevation: 0,

                                    color: Colors.grey[200],
                                  ),
                                  margin: EdgeInsets.only(left: 4.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              new MaterialButton(onPressed: _onButtonPressed, child: Text("Оформить заказ на ХХХ руб."), color: Colors.amber,)
            ],
          ),
        ),
      ),
    );
  }
}
