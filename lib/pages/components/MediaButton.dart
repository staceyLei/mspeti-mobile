import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'BaseButton.dart';
import 'package:educationapp/assets/style.dart' as style;

class MediaButton extends StatelessWidget {
  final bool isCamera;
  final Function getImageUrl;
  final Function getVideoUrl;
  final int maxNum;
  MediaButton({this.isCamera, this.getImageUrl, this.getVideoUrl,this.maxNum});

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
    List<Asset> image = await MultiImagePicker.pickImages(
        enableCamera: isCamera,
        maxImages: maxNum,
        materialOptions: MaterialOptions(
            startInAllView: true,
            allViewTitle: '所有照片',
            selectionLimitReachedText: '最多只能选择6张',
            textOnNothingSelected: '没有选择照片'));
    if (image != null) {
      //返回的是byteData，将其全部转为file
      List<File> imgList = [];
      Directory _directory = await getTemporaryDirectory();
      Directory _imgDrc =
          await Directory('${_directory.path}/image/').create(recursive: true);
      String path = _imgDrc.path;
      for (var i = 0; i < image.length; i++) {
        ByteData byteData = await image[i].getByteData();
        // 生成缓存图片模拟上传
        File f = File('${path}originImg${image[i].name}')
          ..writeAsBytesSync(byteData.buffer.asUint8List());
        imgList.add(f);
      }
      getImageUrl(imgList);
    }
  }

  // 打开手机视频/拍摄获取图片
  _getVideo(bool isCamera) async {
    var source = isCamera ? ImageSource.camera : ImageSource.gallery;
    File video = await ImagePicker.pickVideo(source: source);
    if (video != null) getVideoUrl([video]);
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
            )));
  }
}
