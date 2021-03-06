import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/data/tu_chong_repository.dart';
import 'package:flutter_xiecheng/data/tu_chong_source.dart';

class TravelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewState();
}

class _NewState extends State<TravelPage> with AutomaticKeepAliveClientMixin{
  TuChongRepository tuChongRepository = TuChongRepository();
  bool loadSuccess = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Traavel initState");
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
        child: StreamBuilder(
          builder: (context, snapshot) {
            List<TuChongItem> list = snapshot.data;
            return _listViewCustom(list);
          },
          stream: tuChongRepository.rebuild,
          initialData: null,
        ),
        onRefresh: () => _initData());
  }

  Widget _listViewCustom(List<TuChongItem> data) {
    int itemCount = 20;
    data == null ? itemCount : (itemCount = data.length);
    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(), //确保视图始终可以滚动
        controller: _scrollController(),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
//              _initData();
            },
            leading: data == null
                ? Image.asset("images/xiecheng_active.png",
                    width: 62, height: 62)
                : Image.network(
                    data[index].images[0].imageUrl,
                    width: 100,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
            title: data == null
                ? Text(" $loadSuccess flutter hello world!!!!")
                : Text(data[index].title),
          );
        });
  }

  ScrollController _scrollController() {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      double maxScrollOffset =
          scrollController.position.maxScrollExtent; //当前的可滑动的最大位置
      double curOffset = scrollController.offset;
      print("---------$maxScrollOffset++++++++ $curOffset");

      if (curOffset == maxScrollOffset) {
        //滚动到最低
        var loadMore = _loadMore();
      }
    });
    return scrollController;
  }

  Future<void> _initData() async {
    loadSuccess = await tuChongRepository.refresh();
    if (loadSuccess) {}
  }

  Future<bool> _loadMore() async {
    var bool = await tuChongRepository.loadMore();
    if (bool) {
      return tuChongRepository.hasMore;
    }
    return false;
  }

  @override
  bool get wantKeepAlive => true;
}
