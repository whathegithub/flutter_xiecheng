import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/model/home_model_1.dart';
import 'package:dio/dio.dart';
import 'package:flutter_xiecheng/model/common_model.dart';
import 'package:flutter_xiecheng/model/home_model.dart';

const HOME_URL = "https://cdn.lishaoy.net/ctrip/homeConfig.json";

class HomeDao {



  void loadHomeData() async {
    var response = await Dio().get(HOME_URL); //获取到的是json
    var statusCode = response.statusCode;
    if(statusCode == 200) {
      var commonModel = HomeModel.fromJson(response.data);
    }
  }

}