import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter_app/pages/MyPage.dart';
import 'package:flutter_app/pages/SearchPage.dart';
import 'package:flutter_app/pages/TravelPage.dart';

class TabNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabNavigatorState();
  }
}

class _TabNavigatorState extends State<TabNavigator> {
  int _currentIndex = 0;
  Color _defaultColor = Colors.grey;
  Color _activeColor = Colors.blue;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: getPages(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: getBottomItems(),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  void onBottomBarItemClick(int index) {
    _controller.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> getPages() {
    return [
      HomePage(),
      SearchPage(),
      TravelPage(),
      MyPage(),
    ];
  }

  List<BottomNavigationBarItem> getBottomItems() {
    return [
      createBarItem(Icons.home, "首页"),
      createBarItem(Icons.search, "搜索"),
      createBarItem(Icons.camera_alt, "旅拍"),
      createBarItem(Icons.account_circle, "我的"),
    ];
  }

  BottomNavigationBarItem createBarItem(IconData icon, String title) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _defaultColor,
      ),
      activeIcon: Icon(
        icon,
        color: _activeColor,
      ),
      label: title,
    );
  }
}
