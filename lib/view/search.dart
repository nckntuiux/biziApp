import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ltx_deliver/assets/styles.dart';
import 'package:ltx_deliver/view/account/account_edit.dart';
import 'package:ltx_deliver/view/login.dart';
import 'package:ltx_deliver/view/order/account_orders.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  void _onActionLoginItemPressed() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_rounded)),
          title: Text('Поиск', style: sAppBar,),
          elevation: 0,
          brightness: Brightness.light,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),

              ),
            ),
          ),
        ),
        body: Container(
          child: new ListView(children: [
            Container(
              margin: EdgeInsets.all(8.0),
              child: new Row(
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0,),
                        child: new Text("2499 ₽ | Полутороспальный (1.5)", style: sAlt,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0,),
                        child: new Text("Сатин Люкс+", style: sHeading,),
                      ),
                      new Row(
                        children: [
                          new Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              child: new FlatButton(
                                onPressed: _onActionLoginItemPressed,
                                child: Text("В корзину", style: sButton),
                                minWidth: 54,
                                height: 48,
                                color: Colors.grey[200],
                              ),
                            ),
                            //margin: EdgeInsets.all(4.0),
                          ),
                          new Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              child: new FlatButton(
                                onPressed: _onActionLoginItemPressed,
                                child: Text("5", style: sButton),
                                minWidth: 54,
                                height: 48,
                                color: Colors.grey[200],
                              ),
                            ),
                            margin: EdgeInsets.all(4.0),
                          ),
                          new Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              child: new FlatButton(
                                onPressed: _onActionLoginItemPressed,
                                child: Text("15", style: sButton),
                                minWidth: 54,
                                height: 48,
                                color: Colors.grey[200],
                              ),
                            ),
                            margin: EdgeInsets.all(4.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            new Divider(color: Colors.white,),
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0, left: 4.0),
                      child: new Text("2499 ₽ | Полутороспальный (1.5)", style: sAlt,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0, left: 4.0),
                      child: new Text("Сатин Люкс+", style: sHeading,),
                    ),
                    new Row(
                      children: [
                        new Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            child: new FlatButton(
                              onPressed: _onActionLoginItemPressed,
                              child: Text("+", style: sButton,),
                              minWidth: 54,
                              height: 48,
                              color: Colors.grey[200],
                            ),
                          ),
                          margin: EdgeInsets.only(left: 4.0),
                        ),
                        new Container(
                          child: new Text("5", style: sButton,),
                          padding: new EdgeInsets.symmetric(horizontal: 32.0),
                          margin: EdgeInsets.only(left: 4.0),
                        ),
                        new Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            child: new FlatButton(
                              onPressed: _onActionLoginItemPressed,
                              child: Text("-", style: sButton,),
                              minWidth: 54,
                              height: 48,
                              color: Colors.grey[200],
                            ),
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
    ));
  }

}
