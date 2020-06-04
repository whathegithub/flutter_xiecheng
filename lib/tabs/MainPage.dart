import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_xiecheng/model/home_model.dart';
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


  HomeModel _homeModel = HomeModel(

  );


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 200.0,
                flexibleSpace: _banner_view(),
              ),
              SliverGrid.count(
                crossAxisCount: 4,
                children: List.generate(8, (index) {
                  return Container(
                    color: Colors.primaries[index % Colors.primaries.length],
                    alignment: Alignment.center,
                    child: Text(
                      '$index',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  );
                }).toList(),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((content, index) {
                  return Container(
                    height: 85,
                    alignment: Alignment.center,
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Text(
                      '$index',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  );
                }, childCount: 25),
              )
            ],
          ),
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
