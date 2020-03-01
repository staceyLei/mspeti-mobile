import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'BaseButton.dart';
import 'package:educationapp/assets/style.dart' as style;

class MediaButton extends StatelessWidget {
  final bool isCamera;
  final Function getImageUrl;
  final Function getVideoUrl;
  MediaButton({this.isCamera, this.getImageUrl, this.getVideoUrl});

  _showPhotoModal(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (_) => Container(
            color: Colors.white,
            width: style.width,
            height: 155,
            child: Column(children: [
              BaseButton(
                title: '拍照',
                onTap: () {
                  _getImage(true);
                  Navigator.pop(_);
                },
              ),
              BaseButton(
                title: '从手机相册选取',
                onTap: () {
                  _getImage(false);
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

  _showVideoModal(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (_) => Container(
            color: Colors.white,
            width: style.width,
            height: 155,
            child: Column(children: [
              BaseButton(
                title: '拍摄',
                onTap: () {
                  _getVideo(true);
                  Navigator.pop(_);
                },
              ),
              BaseButton(
                title: '从手机选取视频',
                onTap: () {
                  _getVideo(false);
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

  // 打开手机相册/拍照获取图片
  _getImage(bool isCamera) async {
    var source = isCamera ? ImageSource.camera : ImageSource.gallery;
    File image = await ImagePicker.pickImage(source: source);
    getImageUrl(image.path);
  }

  // 打开手机视频/拍摄获取图片
  _getVideo(bool isCamera) async {
    var source = isCamera ? ImageSource.camera : ImageSource.gallery;
    File video = await ImagePicker.pickVideo(source: source);
    getVideoUrl(video.path);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () =>
            isCamera ? _showPhotoModal(context) : _showVideoModal(context),
        child: Container(
          width: style.width / 5,
          alignment: Alignment.center,
          height: style.width / 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: style.lightGrey, width: 1),
          ),
          child: Icon(
            isCamera ? Icons.camera_alt : Icons.videocam,
            size: isCamera ? 42 : 50,
            color: style.lightGrey,
          ),
        ));
  }
}
