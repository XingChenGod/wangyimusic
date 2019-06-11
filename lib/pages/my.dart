import 'package:flutter/material.dart';


import '../components/my-components/my-horizontal-menu.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.cloud_upload,
                    color: Colors.black12,
                    size: 30,
                  )),
              Align(
                alignment: Alignment.center,
                child:
                    Text('我的音乐', style: TextStyle(fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
        centerTitle: true,
        titleSpacing: 10,
      ),
      body: ListView(
        children: <Widget>[
          MyHorizontalMenu()
        ],
      ),
    );
  }
}
