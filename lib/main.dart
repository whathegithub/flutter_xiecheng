import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tabs/TabsController.dart';


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
       return Scaffold(
           body:TabsController()
       );
  }
}





