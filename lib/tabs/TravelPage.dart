import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/data/tu_chong_repository.dart';
import 'package:flutter_xiecheng/data/tu_chong_source.dart';

class TravelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewState();
}

class _NewState extends State<TravelPage> {
  TuChongRepository tuChongRepository = TuChongRepository();
  bool loadSuccess = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: StreamBuilder(
              builder: (context, snapshot) {
                List<TuChongItem> list = snapshot.data;
                return _listViewCustom(list);
              },
              stream: tuChongRepository.rebuild,
              initialData: null,
            ))
      ],
    );
  }

  Widget _listViewCustom(List<TuChongItem> data) {
    int itemCount = 20;
    data == null ? itemCount : (itemCount = data.length);
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              _initData();
            },
            leading: data == null
                ? Image.asset("images/xiecheng_active.png",
                    width: 62, height: 62)
                : Image.network(data[index].images[0].imageUrl,width: 100,height: 80 ,fit: BoxFit.fill,),
            title: data == null
                ? Text(" $loadSuccess flutter hello world!!!!")
                : Text(data[index].title),
          );
        });
  }

  void _initData() async {
     loadSuccess = await tuChongRepository.refresh();
  }
}
