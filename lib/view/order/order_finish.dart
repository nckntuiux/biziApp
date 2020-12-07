import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

import '../../assets/styles.dart';
import '../../assets/strings.dart';

class FinishOrderPage extends StatefulWidget {
  FinishOrderPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FinishOrderPageState createState() => _FinishOrderPageState();
}

class _FinishOrderPageState extends State<FinishOrderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.close)),
        title: Text('Создать заказ'),
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              new Expanded(
                child: ListView(
                  children: [
                    new Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text("Спасибо за заказ!"),
                        new Text("Ищем машину для отправки заказа"),
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
              ),
              //new MaterialButton(onPressed: null, child: Text("Оформить заказ на ХХХ руб."), color: Colors.amber,)
            ],
          ),

        ),
        padding: EdgeInsets.all(16.0),
      ),
    );
  }
}
