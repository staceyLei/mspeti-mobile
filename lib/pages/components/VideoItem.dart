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
    _playerController = VideoPlayerController.asset(widget.video);
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
                  return Center(
                    child: Text('Error:${snapshot.error}'),
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
