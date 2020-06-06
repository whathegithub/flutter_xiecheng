import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/model/home_model_1.dart';
import 'package:dio/dio.dart';
import 'package:flutter_xiecheng/net/bean/common_model.dart';
import 'package:flutter_xiecheng/net/bean/home_model.dart';
import 'package:flutter_xiecheng/net/api/api.dart';
import 'package:flutter_xiecheng/net/status.dart';
import 'package:flutter_xiecheng/res/strings.dart';

//首页数据中心
class HomeRepo {

  Future<HomeModel> getHomePageData() async{
       var response = await Dio().get(Api.PAGE_HOME_URL);

       if(response.statusCode == NetStatus.RESULT_OK){
         HomeModel homeModel = HomeModel.fromJson(response.data);
         return homeModel;
       }else {
         return Future.error(Strings.MESSAGE_ERROR);
       }
  }

}