import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RoadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewState();
}

class _NewState extends State<RoadPage> {
  Response response;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(response.toString()),
    );
  }

  void _loadData() async {
    try {
       response = await Dio().get("http://www.baidu.com");
      print(response);
      setState(() {

      });
    } catch (e) {}
  }
}
