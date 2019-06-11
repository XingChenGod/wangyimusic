import 'package:flutter/material.dart';

class MyHorizontalMenu extends StatelessWidget {
  const MyHorizontalMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            width: 50,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 16.0,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.radio, color: Colors.white, size: 16),
                ),
                Text(
                  '私人FM',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                )
              ],
            ),
          ),
          Container(
            width: 50,
            height: double.infinity,
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 16.0,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.star, color: Colors.white, size: 16),
                ),
                Text(
                  'stai空间',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                )
              ],
            ),
          ),
          Container(
            width: 50,
            height: double.infinity,
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 16.0,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.surround_sound, color: Colors.white, size: 16),
                ),
                Text(
                  '最新电音',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                )
              ],
            ),
          ),
          Container(
            width: 50,
            height: double.infinity,
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 16.0,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.local_movies, color: Colors.white, size: 16),
                ),
                Text(
                  '私藏推荐',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                )
              ],
            ),
          ),
          Container(
            width: 50,
            height: double.infinity,
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 16.0,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.radio, color: Colors.white, size: 16),
                ),
                Text(
                  '亲子频道',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                )
              ],
            ),
          ),
          Container(
            width: 50,
            height: double.infinity,
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 16.0,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.radio, color: Colors.white, size: 16),
                ),
                Text(
                  '私人FM',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                )
              ],
            ),
          ),
          Container(
            width: 50,
            height: double.infinity,
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 16.0,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.radio, color: Colors.white, size: 16),
                ),
                Text(
                  '私人FM',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                )
              ],
            ),
          ),
          Container(
            width: 50,
            height: double.infinity,
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 16.0,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.radio, color: Colors.white, size: 16),
                ),
                Text(
                  '私人FM',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
