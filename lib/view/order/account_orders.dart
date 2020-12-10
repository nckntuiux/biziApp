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
        child: Expanded(
          child: Column(
            children: [
              new Card(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    new Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text("Заказ № 23457-001"),
                        new Text("Доставлен в 23:59 12 декабря 2077 года"),
                        new Divider(),
                        new Text("Склад 1"),
                        new Text("Кантемировская ул., 47А, корп. 2, стр. 6, \nМосква, Россия"),
                        new Text("Получатель: Первышин Михаил Анатольевич"),
                        new Text("+7 (904) 371-48-57"),
                        new Row(
                          children: [
                            new Container(
                                width: 61,
                                height: 61,
                                padding: EdgeInsets.only(right: 15),
                                //margin: EdgeInsets.only(right: 15),
                                child: Image(image: AssetImage('res_fake/fakecontent.jpeg'))),
                            new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                new Text("2499 ₽ | Полутороспальный (1.5)",),
                                new Row(
                                  children: [
                                    new Text("Сатин Люкс+"),
                                    new Text("2 шт."),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
