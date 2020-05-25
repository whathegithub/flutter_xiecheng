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
    return Column(
      children: <Widget>[
        _app_bar(),
        _banner_view(),
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
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              //AppBar渐变遮罩背景
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(14, 20, 0, 0),
            height: 86.0,
            decoration: BoxDecoration(
                color:
                    Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: appBarAlpha == 1.0
                        ? Colors.black12
                        : Colors.transparent,
                    offset: Offset(2, 3),
                    blurRadius: 6,
                    spreadRadius: 0.6,
                  ),
                ]),
            child: SearchBar(
              searchBarType: appBarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
//              inputBoxClick: _jumpToSearch,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: () {},
//              speakClick: _jumpToSpeak,
//              rightButtonClick: _jumpToUser,
            ),
          ),
        ),
        Container(
            height: appBarAlpha > 0.2 ? 0.5 : 0,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]))
      ],
    );
  }
}
