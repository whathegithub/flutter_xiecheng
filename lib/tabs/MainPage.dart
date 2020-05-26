import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_xiecheng/widget/search_bar.dart';

//常量定义在外边
const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '目的地 | 酒店 | 景点 | 航班号';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewState();
}

class _NewState extends State<MainPage> {
  double appBarAlpha = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            _banner_view(),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: 120,
                itemBuilder: ( context,  index) {
                 return Text("我是第 $index 条数据");
                },
              ),
            )
          ],
        ),
        Container(
//          height: 150,
          color: Colors.transparent,
          child: _app_bar(),
        ),
      ],
    );
  }

  _banner_view() {
    return Container(
      height: 200,
      child: Expanded(
          flex: 1,
          child: new Swiper(
            pagination: new SwiperPagination(),
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                "http://a3.att.hudong.com/14/75/01300000164186121366756803686.jpg",
                fit: BoxFit.cover,
              );
            },
            itemCount: 3,
          )),
    );
  }

  _app_bar() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
      height: 50, //如果外层是container,而且设置了高度.则此高度设置没用.因此外层可不设置高度
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Icon(Icons.search),
          ),
          Expanded(
            flex: 5,
            child: TextField(
              enabled: false, //不可点击
              decoration: InputDecoration(
                  border: InputBorder.none, //去掉下划线
//                  icon: Icon(Icons.backup), //左边边图片
                  hintText: SEARCH_BAR_DEFAULT_TEXT),
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.mic),
          )
        ],
      ),
    );
  }
}
