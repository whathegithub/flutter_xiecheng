import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/page/inherited.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewState();
}

class _NewState extends State<MinePage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    var add2 = makeAdder(2);

    return InheritedImpl(
      data: number,
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              setState(() {
                number++;
              });
            },
            child: Text(" + 1 "),
          ),
          WidgetA()
        ],
      ),
    );
  }

  makeAdder(num addBy) {
    return (num i) => addBy + i;
  }
}

class WidgetA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _myState();
}

class _myState extends State<WidgetA> {
  @override
  Widget build(BuildContext context) {
    var data = InheritedImpl.of(context).data;
    return Text("-------------------- ${data}");
  }
}
