import 'dart:io';

import 'package:educationapp/model/GrowUpM.dart';
import 'package:educationapp/pages/components/MediaButton.dart';
import 'package:educationapp/pages/components/VideoItem.dart';
import 'package:educationapp/pages/components/VideoPreview.dart';
import 'package:educationapp/provider/GrowUpProvider.dart';
import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';
import 'package:educationapp/pages/container/PhotoPreview/PhotoPreview.dart';
import 'package:provider/provider.dart';
import 'GrowUpItem.dart';

class NewGrowUp extends StatefulWidget {
  final arguments;
  NewGrowUp({this.arguments});
  @override
  _NewGrowUpState createState() => _NewGrowUpState();
}

class _NewGrowUpState extends State<NewGrowUp> {
  final TextEditingController _controller = TextEditingController();
  GrowUpM _item;
  bool _isNew;
  bool _show = false;
  List<String> _pubImg = [];
  String _pubVideo;

  @override
  void initState() {
    super.initState();
    _isNew = widget.arguments['status'] == 0; //0 新增 1 详情
    _item = widget.arguments['item'];
  }

  List<Widget> _renderDetails() {
    return [
      GrowUpItem(
        item: _item,
        itemFunc: _handleOpenPhoto,
        videoFunc: _handleChangeVideo,
      ),
    ];
  }

  _handleOpenPhoto() {
    setState(() {
      _show = true;
    });
  }

  _handleClosePhoto() {
    setState(() {
      _show = false;
    });
  }

  _handleChangeVideo() {
    navigatorKey.currentState
        .pushNamed('/VideoPreview', arguments: _item.pubVideo);
  }

  _handleGetUrl(bool isImg, List<File> url) {
    setState(() {
      if (isImg) {
        List<String> list = url.map((f) => f.path).toList();
        _pubImg = [..._pubImg, ...list];
      } else {
        _pubVideo = url[0].path ?? '';
      }
    });
  }

  List<Widget> _renderNew() {
    return <Widget>[
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: style.secondFontColor, width: 1))),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 200, maxHeight: 200),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
                hintText: '请输入成长记录...',
                hintStyle: style.hintStyle.copyWith(fontSize: style.mFontSize),
                border: UnderlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
      ),
      SizedBox(height: 15),
      Container(
          width: style.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Wrap(spacing: 10, runSpacing: 10, children: [
            ..._getUpLoadImage(),
            if (_pubImg.length < 6)
              MediaButton(
                isCamera: true,
                maxNum: 6 - _pubImg.length,
                getImageUrl: (List url) => _handleGetUrl(true, url),
              ),
            if (_pubVideo != null && _pubVideo != '') _getUpLoadVideo(),
            if (_pubVideo == null || _pubVideo == '')
              MediaButton(
                isCamera: false,
                getVideoUrl: (List url) => _handleGetUrl(false, url),
              ),
          ]))
    ];
  }

  _handleRemoveImg(String url) {
    setState(() {
      _pubImg = _pubImg.where((e) => e != url).toList();
    });
  }

  List<Widget> _getUpLoadImage() {
    return _pubImg.map((img) {
      return Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: style.baseRadius,
            child: _getImageItem(img),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => _handleRemoveImg(img),
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: style.baseRadius,
                    color: Colors.black12,
                  ),
                  child: Icon(Icons.close, color: Colors.white, size: 14),
                ),
              ))
        ],
      );
    }).toList();
  }

  Widget _getUpLoadVideo() {
    return Stack(
      children: <Widget>[
        VideoItem(video: _pubVideo),
        Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _pubVideo = null;
                });
              },
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: style.baseRadius,
                  color: Colors.black12,
                ),
                child: Icon(Icons.close, color: Colors.white, size: 14),
              ),
            ))
      ],
    );
  }

  Image _getImageItem(String url) {
    double size = style.width / 5;
    if (url.contains('http')) {
      return Image.network(url, fit: BoxFit.cover, width: size, height: size);
    } else {
      File image = File(url);
      return Image.file(image, fit: BoxFit.cover, width: size, height: size);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      NavLayout(
          title: _isNew ? '创建成长记录' : '成长记录详情',
          backgroundColor: Colors.white,
          components: _isNew ? _renderNew() : _renderDetails(),
          bottom: _isNew
              ? Consumer<GrowUpProvider>(
                  builder: (context, growUp, _) {
                    return InkWell(
                        onTap: () {
                          DateTime now = DateTime.now();
                          String pubDate = [
                            now.year,
                            now.month,
                            now.day,
                            now.hour,
                            now.minute,
                            now.second
                          ].join(',');
                          GrowUpM newItem = GrowUpM('', pubDate,
                              _pubImg.join(','), _pubVideo, _controller.text);
                          growUp.addNewGrowUp(newItem);
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          width: style.width - 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: style.baseGradient),
                          child: Text('提交',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: style.titleSize,
                              )),
                        ));
                  },
                )
              : InkWell(
                  onTap: () {},
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text('',
                          // '分享',
                          style: style.baseFontStyle
                              .copyWith(fontWeight: FontWeight.bold))),
                )),
      if (_show)
        PhotoPreview(arguments: _item.pubImg, handleOnClose: _handleClosePhoto),
    ]);
  }
}
