import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:video_player/video_player.dart';

class GrowUpItem extends StatefulWidget {
  final String headImg;
  final String name;
  final String time;
  final String content;
  GrowUpItem({this.headImg, this.name, this.time, this.content});

  @override
  State<GrowUpItem> createState() {
    return _GrowUpItemState(
        headImg: headImg, name: name, time: time, content: content);
  }
}

class _GrowUpItemState extends State<GrowUpItem> {
  final String headImg;
  final String name;
  final String time;
  final String content;
  VideoPlayerController _videoPlayerController;

  _GrowUpItemState({this.headImg, this.name, this.time, this.content});
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        //确保第一帧在视频初始化后展示
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      width: style.width,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  headImg,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  name,
                  style: style.mFontStyle,
                  maxLines: 2,
                ),
                Text(time,
                    style: style.sFontStyle.copyWith(color: style.lightGrey))
              ]),
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 60),
              width: style.width - 60,
              child: Column(
                children: <Widget>[
                  Text(content, style: style.baseFontStyle),
                  SizedBox(height: 15),
                  _videoPlayerController.value.initialized
                      ? Container(
                        width: 100,
                        height: 100,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: VideoPlayer(_videoPlayerController),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.play_circle_outline,
                                color: Colors.white,
                                size: 60,
                              ),
                              onPressed: () {
                                setState(() {
                                  _videoPlayerController.value.isPlaying
                                      ? _videoPlayerController.pause()
                                      : _videoPlayerController.play();
                                });
                              })
                        ]))
                      : SizedBox()
                ],
              )),
        ],
      ),
    );
  }
}
