import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xiecheng/widget/search_bar.dart';
import 'package:flutter_xiecheng/main.dart';
import 'package:flutter_xiecheng/tabs/MainPage.dart';
import 'package:flutter_xiecheng/tabs/MinePage.dart';
import 'package:flutter_xiecheng/tabs/TravelPage.dart';
import 'package:flutter_xiecheng/tabs/RoadPage.dart';

const JUMP = "跳转";

void main() {
//  if(Platform.isAndroid) {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//  }
  runApp(SplashPage());
}

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _my_state();
}

class _my_state extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/my_app": (context) => MyApp(),
        "/main_page": (context) => MainPage(), //tabs
        "/mine_page": (context) => MinePage(),
        "/road_page": (context) => RoadPage(),
        "/trvel_page": (context) => TravelPage(),
      },
      home: Scaffold(
        body: Builder(builder: (context) {
          print("-------1-------");
          _jumpToMain(context);
          print("-------2-------");
          return Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  "images/splash_bg.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: 60,
                height: 30,
                child: Center(
                  child: Text(JUMP),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  void _jumpToMain(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.popAndPushNamed(context, "/my_app");
    });
    print("-------3-------");
  }
}
