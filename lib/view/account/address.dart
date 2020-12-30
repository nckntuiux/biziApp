import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:ltx_deliver/items.dart';
import 'package:ltx_deliver/view/account/address_edit.dart';

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
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(SFSymbols.chevron_left)),
        title: Text('Адреса доставки'),
        elevation: 0,
        brightness: Brightness.light,
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: _onAddAddressPressed),
        ],
      ),
      body: Container(
        child: new ListView(
            children: [
              new Column(
                children: [
                  new AddressItem(),
                ],
              ),
        ], padding: EdgeInsets.all(8.0),),
        //alignment: AlignmentDirectional.centerStart,
      )
    );
  }

  void _onAddAddressPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddressChangePage()),
    );
  }
}
