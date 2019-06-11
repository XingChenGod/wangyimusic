import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../components/search-components/home-banner.dart';
import '../components/search-components/home-menu.dart';
import '../components/search-components/recommend-music.dart';
import '../components/search-components/tab-music.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchPage();
  }
}

class _SearchPage extends State<SearchPage> {
  ScrollController _scrollController = new ScrollController();
  var before = '';
  var res;
  List items = new List();

  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
  }

  // 获取列表数据
  Future getListDatas() async {
    final response = await http.get(
        'https://short-msg-ms.juejin.im/v1/pinList/recommend?uid=&before=${this.before}&limit=20&device_id=asdasd&token=&src=android');
    if (response.statusCode == 200) {
      final lists = json.decode(response.body)['d']['list'];
      setState(() {
        items.clear();
        items.addAll(lists);
      });
    }
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // 消息提示

  // 图片
  List _handleImages(currentIndex) {
    return items[currentIndex - 6]['pictures'];
  }

  final _searchTitle = '大家都在搜 遇到';
  @override
  Widget build(BuildContext context) {
    getListDatas();
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            bottomOpacity: 0.0,
            brightness: Brightness.light,
            elevation: 0, // 控制tab下的阴影
            leading: Icon(
              Icons.music_video,
              color: Colors.grey,
              size: 32.0,
            ),
            title: Container(
                width: 450.0,
                height: 32.0,
                padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 32.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '$_searchTitle',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ))),
        body: ListView.builder(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          itemCount: items.length + 6,
          itemBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return HomeBanner();
                break;
              case 1:
                return HomeMenu();
                break;
              case 2:
                return RecommendMusic();
                break;
              case 3:
                return TabMusic();
                break;
              case 4:
                return Container(
                  color: Color.fromRGBO(240, 240, 250, 1),
                  height: 4.0,
                );
                break;
              case 5:
                return Container(
                  padding: EdgeInsets.fromLTRB(16.0, 10, 16.0, 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromRGBO(200, 200, 200, 1),
                              width: 0.4))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('云村精选',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          )),
                      GestureDetector(
                        child: Container(
                          width: 96.0,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.update,
                                size: 14.0,
                              ),
                              Text('获取最新内容',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                        onTapUp: null,
                      )
                    ],
                  ),
                );
                break;
              default:
                return Container(
                  padding: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                  child: Card(
                      child: Container(
                    padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 20.0,
                                    backgroundImage: NetworkImage(
                                        '${items[index - 6]['user']['avatarLarge']}'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      '${items[index - 6]['user']['username']}',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              '3小时前',
                              style: TextStyle(
                                color: Colors.grey
                              ),
                            )
                          ],
                        ),
                        Text(
                          '${items[index - 6]['content']}',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                        Wrap(
                          spacing: 2.0,
                          children: items[index - 6]['pictures'].length > 0 ? _handleImages(index).map((pic) {
                            return Container(
                              width: 100,
                              height: 100,
                              child: Image.network(
                                pic,
                                fit: BoxFit.cover
                              ),
                            );
                          }).toList() : [],
                        )
                        // Row()
                      ],
                    ),
                  )),
                );
                break;
            }
          },
        ));
  }
}

// children: <Widget>[
//             HomeBanner(),
//             HomeMenu(),
//             RecommendMusic(),
//             TabMusic(),
//             Container(
//               color: Color.fromRGBO(240, 240, 250, 1),
//               height: 4.0,
//             ),
//             Container(
//               padding: EdgeInsets.fromLTRB(16.0, 10, 16.0, 10),
//               decoration: BoxDecoration(
//                 border: Border(bottom: BorderSide(color: Color.fromRGBO(200, 200, 200, 1), width: 0.4))
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text(
//                     '云村精选',
//                     style: TextStyle(
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.w500,
//                     )
//                   ),
//                   GestureDetector(
//                     child: Container(
//                       width: 96.0,
//                       child: Row(
//                         children: <Widget>[
//                           Icon(Icons.update, size: 14.0,),
//                           Text('获取最新内容', style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500))
//                         ],
//                       ),
//                     ),
//                     onTapUp: null,
//                   )
//                 ],
//               ),
//             )
