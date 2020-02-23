import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:educationapp/pages/components/BaseButton.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class VideoPreview extends StatefulWidget {
  final arguments;
  VideoPreview({this.arguments});
  @override
  _VideoPreviewState createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  VideoPlayerController _playerController;
  ChewieController _chewieController;
  Widget _playWidget;

  @override
  void initState() {
    super.initState();
    _playerController = VideoPlayerController.network(widget.arguments);
    _chewieController = ChewieController(
      videoPlayerController: _playerController,
      aspectRatio: 3 / 2,
      autoInitialize: true,
    );
    _playWidget = Chewie(
      controller: _chewieController,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _playerController.dispose();
    _chewieController.dispose();
  }

  _showSave(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (_) => Container(
            color: Colors.white,
            width: style.width,
            height: 105,
            child: Column(children: [
              BaseButton(
                title: '保存到手机',
                onTap: () {
                  _saveVideo(widget.arguments);
                  Navigator.pop(_);
                },
              ),
              Container(width: style.width, color: style.bgColor, height: 5.0),
              BaseButton(
                title: '取消',
                onTap: () => Navigator.pop(_),
              ),
            ]),
          ));

  _saveVideo(String videoUrl) async {
    var result;
    var appDocDir = await getTemporaryDirectory();
    String savePath = appDocDir.path + videoUrl.split('/').last;
    await Dio().download(videoUrl, savePath);
    result = await ImageGallerySaver.saveFile(savePath);
    print('result:$result');
    if (result) {
      _showToast('保存成功');
    } else {
      _showToast('保存失败');
    }
  }

  _showToast(String msg) {
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15, style.topPadding + 10, 15, 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close, size: 24, color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: () => _showSave(context),
                          child: Icon(Icons.save_alt,
                              size: 24, color: Colors.white)),
                    ]),
              ),
              Expanded(
                  child: Center(
                    child: _playWidget,
                  ),
                  flex: 1)
            ],
          )),
    );
  }
}
