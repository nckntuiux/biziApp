import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:ltx_deliver/assets/ltx_icons.dart';
import 'package:ltx_deliver/view/launch/setbudget.dart';
import 'package:ltx_deliver/view/search.dart';
import 'package:ltx_deliver/items.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../assets/styles.dart';
import '../assets/strings.dart';

import '../ltx.dart';
import 'launch/login.dart';
import 'cart.dart';
import 'account/account.dart';

int _selectedBottomIndex = 0;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  RefreshController _refreshController1 =
      RefreshController(initialRefresh: false);
  RefreshController _refreshController2 =
      RefreshController(initialRefresh: false);
  RefreshController _refreshController3 =
      RefreshController(initialRefresh: false);
  RefreshController _refreshController4 =
      RefreshController(initialRefresh: false);
  TabController? _tabController;
  int _currentIndex = 0;
  final List<Widget> _children = [];

  void _setActiveTabIndex() {
    _currentIndex = _tabController.index;
  }

  int getTabControllerIndex() {
    return _tabController.index;
  }

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

  void _onActionSetBudgetItemPressed() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SetBudgetPage()),
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
    _tabController.addListener(_setActiveTabIndex);
    _onBottomItemTapped(0);
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController1.refreshCompleted();
    _refreshController2.refreshCompleted();
    _refreshController3.refreshCompleted();
    _refreshController4.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    if (mounted) setState(() {});
    _refreshController1.loadComplete();
    _refreshController2.loadComplete();
    _refreshController3.loadComplete();
    _refreshController4.loadComplete();
  }

  Widget _buildBody(BuildContext context) {
    final client = LtxClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<List<Product>>(
      future: client.getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return new GridView.builder(
            itemCount: snapshot.data!.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.2),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return new GridTile(child: new ProductItem(snapshot.data![index]));
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                SFSymbols.search,
              ),
              onPressed: _onSearchItemPressed,
            ),
            title: Text(
              'Бюджет: 23000₽',
              style: sAppBarText,
            ),
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.black.withOpacity(0.3),
                indicatorColor: Colors.black,
                indicatorPadding:
                    EdgeInsets.only(bottom: 4.0, left: 8.0, right: 8.0),
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
                ]),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: new IconButton(
                    icon: Icon(SFSymbols.person_alt_circle),
                    onPressed: _onActionLoginItemPressed),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: new IconButton(
                    icon: Icon(LTX.pie_five),
                    onPressed: _onActionSetBudgetItemPressed),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 28.8,
                    spreadRadius: 2.0,
                  )
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0)),
              child: SizedBox(
                child: BottomNavigationBar(
                  iconSize: 32.0,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(SFSymbols.house),
                      label: 'Главная',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(SFSymbols.cart),
                      label: 'Корзина',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(SFSymbols.person),
                      label: 'Профиль',
                    ),
                  ],
                  currentIndex: _selectedBottomIndex,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.black,
                  //unselectedItemColor: Colors.black,
                  onTap: _onBottomItemTapped,
                ),
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Center(
                  child: SmartRefresher(
                    controller: _refreshController1,
                    enablePullUp: true,
                    header: ClassicHeader(),
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: _buildBody(context),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: SmartRefresher(
                    controller: _refreshController2,
                    enablePullUp: true,
                    header: ClassicHeader(),
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                      child: _buildBody(context)
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: SmartRefresher(
                    controller: _refreshController3,
                    enablePullUp: true,
                    header: ClassicHeader(),
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: _buildBody(context)
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: SmartRefresher(
                    controller: _refreshController4,
                    enablePullUp: true,
                    header: ClassicHeader(),
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: _buildBody(context)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
