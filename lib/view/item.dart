import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:ltx_deliver/ltx.dart';
import 'package:ltx_deliver/main.dart';
import 'package:ltx_deliver/view/launch/login.dart';
import 'package:ltx_deliver/items.dart';

import '../assets/styles.dart';
import '../assets/strings.dart';
import 'order/order_new.dart';


class ItemPage extends StatefulWidget {
  final Product? product;

  ItemPage({Key? key, this.product}) : super(key: key);


  @override
  _ItemPageState createState() => _ItemPageState(product!);
}

class _ItemPageState extends State<ItemPage> {
  Product product;

  _ItemPageState(this.product);

  int inCart = 0;

// Счетчик товаров в корзине, сделано через жопу
  void _onAddItemPressed(int addedItems) {
    if (addedItems == 1) {
      setState(() {
        inCart++;
      });
    } else if (addedItems <= -1) {
      setState(() {
        inCart--;
      });
    } else if (addedItems > 1) {
      setState(() {
        _buildButtons();
        inCart += addedItems;
      });
    } else {
      setState(() {
        _buildButtons();
      });
    }
  }

  void _onButtonPressed() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewOrderPage()),
      );
    });
  }

  void _onActionClearAllPressed() {
    setState(() {
      Navigator.pop(context);
    });
  }

  Widget _buildButtons() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            child: new FlatButton(
              onPressed: () => _onAddItemPressed(-1),
              child: Text(
                "-",
                style: sButton,
              ),
              minWidth: 54,
              height: 48,
              color: Colors.grey[200],
            ),
          ),
          margin: EdgeInsets.only(left: 4.0),
        ),
        new Container(
          child: new Text(
            inCart.toString(),
            style: sButton,
          ),
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          margin: EdgeInsets.only(left: 4.0),
        ),
        new Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            child: new FlatButton(
              onPressed: () => _onAddItemPressed(1),
              child: Text(
                "+",
                style: sButton,
              ),
              minWidth: 54,
              height: 48,
              color: Colors.grey[200],
            ),
          ),
          margin: EdgeInsets.only(left: 4.0),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(SFSymbols.multiply)),
        elevation: 0,
        brightness: Brightness.light,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: new IconButton(
                icon: Icon(SFSymbols.trash),
                onPressed: _onActionClearAllPressed),
          ),
        ],
      ),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  child: Expanded(
                    child: new ListView(
                      children: [
                        new Container(
                          margin: EdgeInsets.all(8.0),
                          child: new Row(
                            children: [
                              new Container(
                                  width: 81,
                                  height: 81,
                                  padding: EdgeInsets.only(right: 15),
                                  //margin: EdgeInsets.only(right: 15),
                                  child: Image(
                                      fit: BoxFit.fitHeight,
                                      image:
                                          AssetImage('assets/fake/fake.png'))),
                              new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 6.0,
                                    ),
                                    child: new Text(
                                      "2499 ₽",
                                      style: sAlt,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 6.0,
                                    ),
                                    child: new Text(
                                      product.name,
                                      style: sHeading,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        new Divider(),
                        new OptionItem(product.options[0], product),
                        new OptionItem(product.options[0], product),
                        Container(color: Colors.black12, child: new OptionItem(product.options[0], product)),
                        new OptionItem(product.options[0], product),
                        new Divider(),
                        new Container(
                          margin: EdgeInsets.all(8.0),
                          child: new Row(
                            children: [
                              _buildButtons(),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: new Text(
                                  "По 5 шт. в упаковке",
                                  style: sAlt,
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            product.description,
                            style: sAlt,
                          ),
                        )
                      ],
                    ),
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
                      child: Text(
                        "2 размера на ХХХ руб. | В каталог",
                        style: sButtonLight,
                      ),
                      color: brandRGB0[900],
                    ),
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
