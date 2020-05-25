import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tabs/TabsController.dart';
void main() {
//  if(Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
       return MaterialApp(
           home:TabsController()
       );
  }
}





