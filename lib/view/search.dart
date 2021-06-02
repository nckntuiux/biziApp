import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:ltx_deliver/assets/styles.dart';
import 'package:ltx_deliver/view/account/account_edit.dart';
import 'package:ltx_deliver/view/launch/login.dart';
import 'package:ltx_deliver/view/order/account_orders.dart';
import 'package:ltx_deliver/items.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final TextEditingController _searchFilter = new TextEditingController();
  String _search = "";

  _SearchPageState() {
    _searchFilter.addListener(_searchListen);
  }

  void _searchListen() {
    if (_searchFilter.text.isEmpty) {
      _search = "";
    } else {
      _search = _searchFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(SFSymbols.chevron_left)),
          title: Text('Поиск', style: sAppBarText,),
          elevation: 0,
          brightness: Brightness.light,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(64),
            child: Padding(
              padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                child: new Container(
                  child: new TextField(
                    controller: _searchFilter,
                    decoration: new InputDecoration(
                        hintText: 'Искать в каталоге',
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.search, color: Colors.black,),
                      )
                    ),
                  ),
                ),
              )
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.2),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: [
                    GridTile(child: new GridItem()),
                    GridTile(child: new GridItem()),
                    GridTile(child: new GridItem()),
                    GridTile(child: new GridItem()),
                    GridTile(child: new GridItem()),
                    GridTile(child: new GridItem()),
                    GridTile(child: new GridItem()),
                    GridTile(child: new GridItem()),
                  ]),
            ),
    ),
        ));
  }

}
