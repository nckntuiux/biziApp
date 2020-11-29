import 'package:flutter/material.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

import '../res/styles.dart';
import '../res/strings.dart';

import 'login.dart';
import 'cart.dart';

int _selectedBottomIndex = 0;

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  void _onBottomItemTapped(int index) {
    setState(() {
      _selectedBottomIndex = index;
      if (_selectedBottomIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
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

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 6, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          leading: Icon(Icons.search),
          title: Text('Lunatex'),
          bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.black.withOpacity(0.3),
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  child: Text('Tab 1'),
                ),
                Tab(
                  child: Text('Investment'),
                ),
                Tab(
                  child: Text('Your Earning'),
                ),
                Tab(
                  child: Text('Current Balance'),
                ),
                Tab(
                  child: Text('Tab 5'),
                ),
                Tab(
                  child: Text('Tab 6'),
                )
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
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'School',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'School',
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
              child: Center(
                child: ListView(children: [
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                ]),
              ),
            ),
            Container(
              child: Center(
                child: ListView(children: [
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                ]),
              ),
            ),
            Container(
              child: Center(
                child: ListView(children: [
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                ]),
              ),
            ),
            Container(
              child: Center(
                child: ListView(children: [
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                ]),
              ),
            ),
            Container(
              child: Center(
                child: ListView(children: [
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                ]),
              ),
            ),
            Container(
              child: Center(
                child: ListView(children: [
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                  new Divider(),
                  new Text('0000'),
                  new Divider(),
                  new Text('0001'),
                  new Divider(),
                  new Text('0010'),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}