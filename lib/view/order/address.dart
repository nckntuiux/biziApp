import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

import '../../assets/styles.dart';
import '../../assets/strings.dart';

class AddressPage extends StatefulWidget {
  AddressPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_rounded)),
        title: Text('Адреса доставки'),
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Container(
        child: new ListView(children: [
          new Card(
            child: new Column(
              children: [
                new Text("Офис (Основной адрес)", style: TextStyle(fontWeight: FontWeight.w800),),
                new Text("Кантемировская ул., 47А, корп. 2, стр. 6,\nМосква, Россия\nПолучатель: Первышин Михаил Анатольевич \n+7 (904) 371-48-57"),
                new Row(
                  children: [
                    new MaterialButton(onPressed: null, child: new Text("Изменить"),),
                    new MaterialButton(onPressed: null, child: new Text("Сделать основным"),)
                  ],
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              children: [
                new Text("Офис (Основной адрес)", style: TextStyle(fontWeight: FontWeight.w800),),
                new Text("Кантемировская ул., 47А, корп. 2, стр. 6,\nМосква, Россия\nПолучатель: Первышин Михаил Анатольевич \n+7 (904) 371-48-57"),
                new Row(
                  children: [
                    new MaterialButton(onPressed: null, child: new Text("Изменить"),),
                    new MaterialButton(onPressed: null, child: new Text("Сделать основным"),)
                  ],
                )
              ],
            ),
          ),
        ]),
        //alignment: AlignmentDirectional.centerStart,
      )
    );
  }
}
