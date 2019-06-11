import 'package:flutter/material.dart';
import 'pages/tab-transfer.dart';

import 'pages/everyDayRecommend.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'my first page',
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/': (context) => TabTransfer(),
        '/home/recommend': (context) => EveryDayRecommend()
      },
      theme: ThemeData(
        bottomAppBarColor: Colors.red,
        primaryColor: Colors.white
      ),
    );
  }
}

