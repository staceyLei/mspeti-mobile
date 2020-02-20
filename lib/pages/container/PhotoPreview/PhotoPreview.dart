import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/BaseButton.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
    _imgList = widget.arguments['img']?.split(',');
  }

  _handleOpenSave() => showModalBottomSheet(
        context: context,
        builder: (_) => Container(
            width: style.width,
            height: 100,
            color: Colors.white,
            child: Column(children: [
              BaseButton(
                title: '保存图片',
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

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
            onTap: () => widget.handleOnClose(),
            onLongPress: _handleOpenSave,
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
                            Image _image = Image.asset(
                              _imgList[index] ?? '',
                              fit: BoxFit.fitWidth,
                            );
                            return GestureDetector(
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
                                child: _image,
                              ),
                            );
                          }))
                ]))));
  }
}
