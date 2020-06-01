import 'package:flutter/material.dart';

class HomePageModel {
  CommonBean config;
  List<CommonBean> bannerList;
  List<CommonBean> localNavList;
  List<CommonBean> subNavList;

  GridNav gridNav;
  SalesBox salesBox;
}

class CommonBean {
  String icon;
  String title;
  String url;
  String statusBarColor;
  String searchUrl;
  String moreUrl;
  bool hideAppBar = true;
}

class GridNav {
  GridNavSon gridNavSon;
}

class SalesBox {
  CommonBean bigCard1;
  CommonBean bigCard2;
  CommonBean smallCard1;
  CommonBean smallCard2;
  CommonBean smallCard3;
  CommonBean smallCard4;
}

class GridNavSon {
  String startColor;
  String endColor;

  CommonBean mainItem;
  CommonBean item1;
  CommonBean item2;
  CommonBean item3;
  CommonBean item4;
}
