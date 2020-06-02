import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/tabs/MainPage.dart';
import 'package:flutter_xiecheng/tabs/MinePage.dart';
import 'package:flutter_xiecheng/tabs/RoadPage.dart';
import 'package:flutter_xiecheng/tabs/TravelPage.dart';

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
              _pageController.jumpToPage(index);
            });
          },
          selectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
                activeIcon: Image.asset("images/xiecheng_active.png",
                    width: 22, height: 22),
                icon: Image.asset("images/xiecheng.png", width: 22, height: 22),
                title: Text("首页")),
            BottomNavigationBarItem(
                activeIcon: Image.asset("images/lvpai_active.png",
                    width: 22, height: 22),
                icon: Image.asset("images/lvpai.png", width: 22, height: 22),
                title: Text("旅拍")),
            BottomNavigationBarItem(
                activeIcon: Image.asset("images/mude_active.png",
                    width: 22, height: 22),
                icon: Image.asset("images/mude.png", width: 22, height: 22),
                title: Text("行程")),
            BottomNavigationBarItem(
                activeIcon: Image.asset("images/wode_active.png",
                    width: 22, height: 22),
                icon: Image.asset("images/wode.png", width: 22, height: 22),
                title: Text("我的")),
          ]),
    );
  }


}
