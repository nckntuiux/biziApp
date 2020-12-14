import 'package:flutter/material.dart';
import 'package:ltx_deliver/view/search.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

import '../assets/styles.dart';
import '../assets/strings.dart';

import 'login.dart';
import 'cart.dart';
import 'account/account.dart';

int _selectedBottomIndex = 0;

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;
  int _currentIndex = 0;
  final List<Widget> _children = [];

  void _onBottomItemTapped(int index) {
    setState(() {
      _selectedBottomIndex = index;
      if (_selectedBottomIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        );
      } else if (_selectedBottomIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountPage()),
        );
      }
    });
  }

  void _onActionLoginItemPressed() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  void _onSearchItemPressed() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchPage()),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 5, vsync: this, initialIndex: 0);
    _onBottomItemTapped(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(icon: Icon(Icons.search), onPressed: _onSearchItemPressed,),
            title: Text('Lunatex', style: sAppBar,),
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.black.withOpacity(0.3),
                indicatorColor: Colors.black,
                indicatorPadding: EdgeInsets.only(bottom: 4.0, left: 8.0, right: 8.0),
                tabs: [
                  Tab(
                    child: Text('Недавние'),
                  ),
                  Tab(
                    child: Text('Комплекты белья'),
                  ),
                  Tab(
                    child: Text('Подушки'),
                  ),
                  Tab(
                    child: Text('Одеяла'),
                  ),
                  Tab(
                    child: Text('Рынок'),
                  ),
                ]),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: new IconButton(icon: Icon(Icons.person_outline), onPressed: _onActionLoginItemPressed),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [ BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 28.8,
                  spreadRadius: 2.0,
                )]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
              child: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Главная',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Корзина',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Профиль',
                  ),
                ],
                currentIndex: _selectedBottomIndex,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.amber[800],
                unselectedItemColor: Colors.black,
                onTap: _onBottomItemTapped,
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: ListView(children: [
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
                ),
              ),
              Container(
                child: Center(
                  child: ListView(children: [
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
                ),
              ),
              Container(
                child: Center(
                  child: ListView(children: [
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
                ),
              ),
              Container(
                child: Center(
                  child: ListView(children: [
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
                ),
              ),
              Container(
                child: Center(
                  child: ListView(children: [
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}