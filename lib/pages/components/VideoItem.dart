import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:educationapp/assets/style.dart' as style;

class VideoItem extends StatefulWidget {
  final String video;
  VideoItem({@required this.video});
  @override
  State<VideoItem> createState() {
    return _VideoItemState();
  }
}

class _VideoItemState extends State<VideoItem> {
  VideoPlayerController _playerController;
  Future _videoFuture;
  @override
  void initState() {
    super.initState();
    if (widget.video.contains('http')) {
      _playerController = VideoPlayerController.network(widget.video);
    } else {
      File f = File(widget.video);
      _playerController = VideoPlayerController.file(f);
    }
    _videoFuture = _playerController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _playerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: FutureBuilder(
          future: _videoFuture,
          builder: (buildContext, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(color: style.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              default:
                if (snapshot.hasError) {
                  print('Error:${snapshot.error}');
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.red, width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.priority_high, color: Colors.red, size: 24),
                        Text('加载失败',
                            style:
                                style.baseFontStyle.copyWith(color: Colors.red))
                      ],
                    ),
                  );
                } else {
                  return Stack(alignment: Alignment.center, children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: 75,
                        height: 75,
                        child: VideoPlayer(_playerController),
                      ),
                    ),
                    Icon(Icons.play_circle_outline,
                        color: Colors.white, size: 40)
                  ]);
                }
            }
          }),
    );
  }
}
