import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_xiecheng/common/common.dart';
import 'package:flutter_xiecheng/net/api/api.dart';
import 'package:flutter_xiecheng/net/bean/home_model.dart';
import 'package:flutter_xiecheng/net/repo/home_repo.dart';
import 'package:flutter_xiecheng/res/strings.dart';
import 'package:flutter_xiecheng/widget/search_bar.dart';
import 'package:flutter_xiecheng/widget/widget_progress.dart';

//常量定义在外边
const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '目的地 | 酒店 | 景点 | 航班号';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewState();
}

class _NewState extends State<MainPage> {
  double appBarAlpha = 0;
  StreamController<HomeModel> _streamController;
  Dio _dio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BaseOptions baseOptions = BaseOptions(connectTimeout: 3000);
    _dio = Dio(baseOptions);
    _streamController = StreamController();
    getHomeData();
  }

  void getHomeData() async {
    try {
      await _dio.get(Api.PAGE_HOME_URL).then((value) {
        print('------then');
        var homeModel = HomeModel.fromJson(value.data);
        _streamController.add(homeModel);
      });
    } on DioError catch (e) {
      print("------DioError");
      _streamController.addError(Strings.NET_TIME_OUT);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomeModel>(
        stream: _streamController.stream,
//        initialData: HomeModel(),//没有初始数据可先不用
        builder: (BuildContext context, AsyncSnapshot<HomeModel> snapshot) {
          //容错处理
          //请求的数据为空   loadingempty
          //正在请求数据u    loading
          //网络错误         error
          //请求到数据       ...
          print("-----------homepage $snapshot --- ${snapshot.data}");
//          build本身会调用一次, stream等待链接时也会调用
//          connectstate :none , active , wating ,done
          var connectState = snapshot
              .connectionState; //不能使用connectState做网络请求状态判断.只要有数据add进来,它的状态就是ConnectionState.active

          if (snapshot.hasError) {
            return StatusViews(LoadStatus.fail);
          }

          if (connectState == ConnectionState.waiting) {
            return StatusViews(LoadStatus.loading);
          }

          return Stack(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: CustomScrollView(
                  slivers: <Widget>[
                      SliverAppBar(
                      pinned: true,
                      primary: false,
                      backgroundColor: Colors.white,
                      expandedHeight: 200.0,
                      flexibleSpace: _banner_view(snapshot.data),
                    ),
                    SliverGrid.count(
                      crossAxisCount: 4,
                      children: List.generate(8, (index) {
                        return Container(
                          color:
                              Colors.primaries[index % Colors.primaries.length],
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
                          color:
                              Colors.primaries[index % Colors.primaries.length],
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
        });
  }

  _banner_view(HomeModel data) {
    return Container(
      height: 200,
      child: Expanded(
          flex: 1,
          child: new Swiper(
            onTap: (index) {
              print("---------");
              Navigator.pushNamed(context, "/web_page",
                  arguments: data.bannerList[index].url);
            },
            pagination: new SwiperPagination(),
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                data.bannerList[index].icon,
                fit: BoxFit.cover,
              );
            },
            itemCount: data.bannerList == null ? 0 : data.bannerList.length,
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
