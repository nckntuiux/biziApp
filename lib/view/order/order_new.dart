import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ltx_deliver/items.dart';

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

  String _finishHeader = "Проверьте адрес";
  String _finishAlt = "Нажмите для выбора правильного";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.close)),
        title: Text('Создать заказ', style: sAppBarText,),
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
                    Center(
                      child: new Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          new Text(_finishHeader, style: sHeadingFinish,),
                          new Text(_finishAlt, style: sAltFinish,),
                          new Divider(color: colorWhite, height: 80,),
                          new Card(
                            child: Container(
                              width: double.infinity,
                              child: new AddressTextItem(),
                              padding: EdgeInsets.all(8.0),
                            ),
                          ),
                        ],),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                child: new MaterialButton(
                  height: 48,
                  minWidth: double.infinity,
                  onPressed: _onButtonPressed,
                  child: Text("Оформить заказ на ХХХ руб.", style: sButtonLight,),
                  color: brandRGB0[900],
                ),
              )
            ],
          ),

        ),
        padding: EdgeInsets.all(16.0),
      ),
    );
  }

  void _onButtonPressed() {
    setState(() {
      _finishHeader = "Cпасибо за заказ!";
      _finishAlt = "Ищем водителя поблизости";
    });
  }


}
