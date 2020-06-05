import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/tabs/HomePage.dart';
import 'package:flutter_xiecheng/tabs/MinePage.dart';
import 'package:flutter_xiecheng/tabs/RoadPage.dart';
import 'package:flutter_xiecheng/tabs/TravelPage.dart';

const PAGE_HOME = "首页";
const PAGE_TRAVEL = "旅拍";
const PAGE_ROAD = "行程";
const PAGE_MINE = "我的";

class TabsController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewState();
}

class _NewState extends State<TabsController> {
  var selectIndex = 0;

  final tabs = [
    MainPage(),
    TravelPage(),
    RoadPage(),
    MinePage(),
  ];

  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0,keepPage: true,viewportFraction: 1);//后边注意一下keeppage

  }

  @override
  Widget build(BuildContext context) {
//    print(tabs[selectIndex]);
    return Scaffold(
      body: PageView.builder(
          itemCount: tabs.length,
          controller:_pageController,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return tabs[index];
          }),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectIndex,
          onTap: (index) {
            setState(() {
              //setstate后会重新调用build
              selectIndex = index;
              _pageController.jumpToPage(index);//点击bottombar,pageview跳转到指定页面
            });
          },
          selectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
                activeIcon: Image.asset("images/xiecheng_active.png",
                    width: 22, height: 22),
                icon: Image.asset("images/xiecheng.png", width: 22, height: 22),
                title: Text(PAGE_HOME)),
            BottomNavigationBarItem(
                activeIcon: Image.asset("images/lvpai_active.png",
                    width: 22, height: 22),
                icon: Image.asset("images/lvpai.png", width: 22, height: 22),
                title: Text(PAGE_TRAVEL)),
            BottomNavigationBarItem(
                activeIcon: Image.asset("images/mude_active.png",
                    width: 22, height: 22),
                icon: Image.asset("images/mude.png", width: 22, height: 22),
                title: Text(PAGE_ROAD)),
            BottomNavigationBarItem(
                activeIcon: Image.asset("images/wode_active.png",
                    width: 22, height: 22),
                icon: Image.asset("images/wode.png", width: 22, height: 22),
                title: Text(PAGE_MINE)),
          ]),
    );
  }


}
