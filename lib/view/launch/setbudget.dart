import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ltx_deliver/items.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

import '../../assets/styles.dart';
import '../../assets/strings.dart';

class SetBudgetPage extends StatefulWidget {
  SetBudgetPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SetBudgetPageState createState() => _SetBudgetPageState();
}

class _SetBudgetPageState extends State<SetBudgetPage> {

  String _finishHeader = "Какой у вас бюджет?";
  String _finishAlt = "Введите сумму";

  final TextEditingController _budgetFilter = new TextEditingController();
  String _budget = "";

  _SetBudgetPageState() {
    _budgetFilter.addListener(_budgetListen);
  }

  void _budgetListen() {
    if (_budgetFilter.text.isEmpty) {
      _budget = "";
    } else {
      _budget = _budgetFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: new Text(_finishHeader, style: sHeadingFinish,),
                          ),
                          new Text(_finishAlt, style: sAltFinish,),
                          new Divider(color: colorWhite, height: 40,),
                          new Padding(
                              padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                child: new Container(
                                  child: new TextField(
                                    controller: _budgetFilter,
                                    decoration: new InputDecoration(
                                        hintText: 'Бюджет',
                                    ),
                                    obscureText: true,
                                  ),
                                ),
                              )
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
                  child: Text("Оформить заказ на ХХХ руб.", style: sButton,),
                  color: Colors.amber,
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
      _finishAlt = "Ищем водителя для доставки вашего заказа";
    });
  }


}
