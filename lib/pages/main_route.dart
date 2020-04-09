import 'package:buchang_education/pages/home_route.dart';
import 'package:buchang_education/pages/mine_route.dart';
import 'package:buchang_education/pages/toutiao_route.dart';
import 'package:buchang_education/widget/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const List titles = <String>['首页', '步长头条', '我的'];
const List icons = <IconData>[
  MyIcons.homeMain,
  MyIcons.homeToutiao,
  MyIcons.homeMine
];

class MainRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainRouteState();
  }
}

class _MainRouteState extends State<MainRoute> {
  // 当前选中的索引
  int _currentIndex = 0;
  var _pages;
  var _pageController = PageController();
  void _pageChanged(int index) {
    print('_pageChanged');
    setState(() {
      if (_currentIndex != index) _currentIndex = index;
    });
  }

  void initData() {
    _pages = [
      HomeRoute(
        header: WaterDropMaterialHeader(
          color: Colors.white,
        ),
      ),
      ToutiaoRoute(
        header: WaterDropMaterialHeader(
          color: Colors.white,
        ),),
      MineRoute(
        header: WaterDropMaterialHeader(
          color: Colors.white,
        ),),
    ];
  }
  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      body: _buildBody(_currentIndex),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBody(int currentIndex) {
    Widget body;


    body = PageView.builder(
        //要点1
          //禁止页面左右滑动切换
          controller: _pageController,
          onPageChanged: _pageChanged,
          //回调函数
          itemCount: _pages.length,
          itemBuilder: (context, index) => _pages[index])
    ;
//    switch (currentIndex) {
//      case 0:
//        body = HomeRoute(
//          header: WaterDropMaterialHeader(
//            color: Colors.white,
//          ),
//        );
//        break;
//      case 1:
//        body = ToutiaoRoute(
//          header: WaterDropMaterialHeader(
//            color: Colors.white,
//          ),);
//        break;
//      case 2:
//        body = MineRoute();
//        break;
//    }
    return body;
  }

  Widget _buildBottomBar() {
    return BottomNavigationBar(
      items: [
        _bottomNavigationBarItem(icons[0], titles[0]),
        _bottomNavigationBarItem(icons[1], titles[1]),
        _bottomNavigationBarItem(icons[2], titles[2]),
      ],
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      onTap: _bottomItemClick,
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData iconData, String title) {
    return BottomNavigationBarItem(
      icon: _icon(iconData, Colors.grey),
      activeIcon: _icon(iconData, Theme.of(context).primaryColor),
      title: Text(
        title,
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  void _bottomItemClick(int value) {
    print('onTap');
    _pageController.jumpToPage(value);
  }

  Widget _icon(IconData iconData, Color color) {
    return Icon(
      iconData,
      color: color,
    );
  }
}
