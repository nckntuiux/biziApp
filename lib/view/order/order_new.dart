import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:ltx_deliver/items.dart';

import '../../assets/styles.dart';
import '../../assets/strings.dart';

class NewOrderPage extends StatefulWidget {
  NewOrderPage({Key? key, this.title}) : super(key: key);

  final String? title;

  bool _hasBeenPressed = false;

  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {

  String _finishHeader = "Проверьте адрес";
  String _finishAlt = "Нажмите для выбора правильного";
  MaterialButton? _orderButton;


  @override
  void initState() {
    _orderButton = new MaterialButton(
      height: 48,
      minWidth: double.infinity,
      onPressed: _onButtonPressed,
      child: Text("Оформить заказ на ХХХ руб.", style: sButtonLight,),
      color: brandRGB0[900],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(SFSymbols.multiply)),
        title: Text('Создать заказ', style: sAppBarText,),
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 54.0),
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
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [ BoxShadow(
                                    color: Colors.black.withOpacity(0.03),
                                    blurRadius: 28.8,
                                    spreadRadius: 2.0,
                                  )]
                              ),
                              child: new Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(8.0),
                                  width: double.infinity,
                                  child: new AddressTextItem(),
                                  padding: EdgeInsets.all(8.0),
                                ),
                              ),
                            ),
                          ],),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  child: _orderButton,
                ),
              ],
            ),
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
      _orderButton = MaterialButton(onPressed: () => {});
    });
  }
}
