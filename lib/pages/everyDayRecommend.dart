import 'package:flutter/material.dart';

class EveryDayRecommend extends StatefulWidget {
  EveryDayRecommend({Key key}) : super(key: key);

  _EveryDayRecommendState createState() => _EveryDayRecommendState();
}

class _EveryDayRecommendState extends State<EveryDayRecommend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ddd'),
      ),
    );
  }
}


// Container(
//             width: double.infinity,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//               Text('每日推荐', style: TextStyle(color: Colors.white))
//             ],
//           ),
//       ),