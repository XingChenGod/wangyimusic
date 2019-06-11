import 'package:flutter/material.dart';

import '../../api/videos.dart';

class VideoList extends StatefulWidget {
  VideoList({Key key}) : super(key: key);

  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  List videoDatas = videos;
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _controller,
      itemCount: videoDatas.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                margin: EdgeInsets.only(bottom: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: DecorationImage(
                    image: NetworkImage(videoDatas[index]['imgUrl']),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Text(
                videoDatas[index]['title'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 6.0, 0, 6.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5)
                  )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 18.0,
                        backgroundImage: NetworkImage(videoDatas[index]['classAttr']),
                      ),
                      SizedBox(width: 10.0,),
                      Text(
                        videoDatas[index]['classes'],
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Container(
                    width: 50.0,
                    margin: EdgeInsets.only(right: 20.0),
                    child: Stack(
                      children: <Widget>[
                        Icon(Icons.thumb_up, color: Colors.grey,),
                        Positioned(
                          top: 0,
                          right: 10,
                          child: Text(
                            '${videoDatas[index]['support']}',
                            style: TextStyle(color: Colors.grey, fontSize: 10.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 50.0,
                    margin: EdgeInsets.only(right: 20.0),
                    child: Stack(
                      children: <Widget>[
                        Icon(Icons.comment, color: Colors.grey,),
                        Positioned(
                          top: 0,
                          right: 10,
                          child: Text(
                            '${videoDatas[index]['comment']}',
                            style: TextStyle(color: Colors.grey, fontSize: 10.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Icon(Icons.donut_small, color: Colors.grey,),
                  )
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 4,
          color: Color.fromRGBO(240, 240, 250, 1),
        );
      },
    );
  }
}