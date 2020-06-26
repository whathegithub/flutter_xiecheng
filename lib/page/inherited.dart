import 'package:flutter/material.dart';

class InheritedImpl extends InheritedWidget {
  final int data;

  InheritedImpl({this.data, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    var oldWidget2 = oldWidget as InheritedImpl;
    print("olddata:${oldWidget2.data},newdata ${this.data}");
    return oldWidget2.data != this.data;
  }

  static InheritedImpl of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedImpl>();
  }
}
