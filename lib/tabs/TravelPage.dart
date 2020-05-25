import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewState();
}

class _NewState extends State<TravelPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("images/xiecheng_active.png",width: 42,height: 42),
    );
  }
}
