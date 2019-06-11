import 'package:flutter/material.dart';

import '../components/video-components/video-list.dart';

class VideoPage extends StatefulWidget {
  VideoPage({Key key}) : super(key: key);

  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> with SingleTickerProviderStateMixin {
  List tabs = ['推荐', 'LOOK直播', 'Stage', '现场', '翻唱', '听BGM', '广场'];
  List<Widget> tabViews = [VideoList(), Container(
            alignment: Alignment.center,
            child: Text('暂无推荐', textScaleFactor: 5),
          ),
          Container(
            alignment: Alignment.center,
            child: Text('暂无推荐', textScaleFactor: 5),
          ),
          Container(
            alignment: Alignment.center,
            child: Text('暂无推荐', textScaleFactor: 5),
          ),
          Container(
            alignment: Alignment.center,
            child: Text('暂无推荐', textScaleFactor: 5),
          ),
          Container(
            alignment: Alignment.center,
            child: Text('暂无推荐', textScaleFactor: 5),
          ),
          Container(
            alignment: Alignment.center,
            child: Text('暂无推荐', textScaleFactor: 5),
          )];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTapUp: null,
                child: SizedBox(
                  width: double.infinity,
                  height: 10.0
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.camera_alt,
                    color: Colors.black12,
                    size: 30.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 30.0,
                      margin: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color.fromRGBO(220, 220, 220, 0.5)),
                      child: Center(
                        child: SizedBox(
                          width: 320.0,
                          height: double.infinity,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 2.0),
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              hintText: '遇到 最近很火',
                            ),
                            onTap: () {
                              print('点了搜索');
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        elevation: 0,
        bottom: TabBar(
          indicatorColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.red,
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          unselectedLabelColor: Colors.black,
          controller: _tabController,
          tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabViews.map((e) {
          //创建3个Tab页
          return e;
        }).toList(),
      ),
    );
  }
}
