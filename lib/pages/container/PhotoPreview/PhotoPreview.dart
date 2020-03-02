import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/BaseButton.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class PhotoPreview extends StatefulWidget {
  final arguments;
  final Function handleOnClose;
  PhotoPreview({this.arguments, this.handleOnClose});
  @override
  _PhotoPreviewState createState() => _PhotoPreviewState();
}

class _PhotoPreviewState extends State<PhotoPreview> {
  List<String> _imgList;
  double _opacity = 1;
  double _centerHeight = style.height / 2;
  double _startY;
  bool _isMoving = false;
  double _moveY = 0;
  double _moveX = 0;

  @override
  void initState() {
    super.initState();
    _imgList = widget.arguments?.split(',');
  }

  _handleOpenSave(String imgUrl) => showModalBottomSheet(
        context: context,
        builder: (_) => Container(
            width: style.width,
            height: 100,
            color: Colors.white,
            child: Column(children: [
              BaseButton(
                title: '保存图片',
                onTap: () {
                  _savePhoto(imgUrl);
                  Navigator.pop(_);
                },
              ),
              BaseButton(
                title: '取消',
                onTap: () => Navigator.pop(_),
              )
            ])),
      );

  // _handleChangeMoving(bool change) {
  //   setState(() {
  //     _isMoving = change;
  //     if (!change) {
  //       _moveY = 0;
  //       _moveX = 0;
  //     }
  //   });
  // }
  _savePhoto(String imgUrl) async {
    var result;
    if (imgUrl.contains('http')) {
      // 访问网络请求图片
      Response response = await Dio()
          .get(imgUrl, options: Options(responseType: ResponseType.bytes));
      result =
          await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    } else {
      result = await ImageGallerySaver.saveFile(imgUrl);
    }
    if (result.isNotEmpty) {
      _showToast('保存成功:$result');
    } else {
      _showToast('保存失败');
    }
  }

  Image _getImageItem(String url) {
    if (url.contains('http')) {
      return Image.network(url, fit: BoxFit.fitWidth);
    } else {
      File image = File(url);
      return Image.file(image, fit: BoxFit.fitWidth);
    }
  }

  _showToast(String msg) {
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
            onTap: () => widget.handleOnClose(),
            child: Opacity(
                opacity: _opacity,
                child: Stack(children: [
                  Container(
                    width: style.width,
                    height: style.height,
                    color: Colors.black,
                  ),
                  Positioned(
                      child: Swiper(
                          scale: 0.95,
                          pagination: _isMoving
                              ? null
                              : SwiperPagination(
                                  alignment: Alignment.bottomCenter,
                                  builder: SwiperCustomPagination(
                                      builder: (_swiperC, config) => Text(
                                          '${config.activeIndex + 1}/${_imgList.length}',
                                          style: style.mFontStyle.copyWith(
                                              fontSize: style.titleSize,
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.none)))),
                          loop: false,
                          itemCount: _imgList.length,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onLongPress: () =>
                                  _handleOpenSave(_imgList[index]),
                              onVerticalDragStart: (details) {
                                setState(() {
                                  _startY = details.globalPosition.dy;
                                });
                              },
                              onVerticalDragEnd: (details) {
                                double _direction =
                                    details.velocity.pixelsPerSecond.direction;
                                if (_direction > 0) {
                                  widget.handleOnClose();
                                }
                                // _handleChangeMoving(false);
                              },
                              onVerticalDragUpdate: (details) {
                                double moveY =
                                    details.globalPosition.dy - _startY;
                                if (moveY > 0 && _opacity >= 0) {
                                  setState(() {
                                    // if (!_isMoving) {
                                    //   _isMoving = true;
                                    // }
                                    _opacity = (moveY / _centerHeight) <= 1
                                        ? 1 - moveY / _centerHeight
                                        : 0;
                                  });
                                }
                              },
                              child: ClipRect(
                                child: _getImageItem(_imgList[index]),
                              ),
                            );
                          }))
                ]))));
  }
}
