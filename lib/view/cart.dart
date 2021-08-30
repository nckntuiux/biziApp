import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:ltx_deliver/view/launch/login.dart';
import 'package:ltx_deliver/items.dart';

import '../assets/styles.dart';
import '../assets/strings.dart';
import 'order/order_new.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key, this.title}) : super(key: key);

  final String? title;

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
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(SFSymbols.multiply)),
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
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.17),
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        children: [
                          //GridTile(child: new ProductItem()),
                          //GridTile(child: new ProductItem()),
                          //GridTile(child: new ProductItem()),
                          //GridTile(child: new ProductItem()),
                          //GridTile(child: new ProductItem()),
                          //GridTile(child: new ProductItem()),
                          //GridTile(child: new ProductItem()),
                          //GridTile(child: new ProductItem()),
                        ]),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    child: new FlatButton(
                      onPressed: _onButtonPressed,
                      height: 48,
                      minWidth: double.infinity,
                      child: Text("Оформить заказ на ХХХ руб.", style: sButtonLight,),
                      color: brandRGB0[900],),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
