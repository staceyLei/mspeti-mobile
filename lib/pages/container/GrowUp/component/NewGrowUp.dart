import 'package:educationapp/pages/components/MediaButton.dart';
import 'package:educationapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:educationapp/pages/components/NavLayout.dart';
import 'package:educationapp/pages/container/PhotoPreview/PhotoPreview.dart';
import 'GrowUpItem.dart';

class NewGrowUp extends StatefulWidget {
  final arguments;
  NewGrowUp({this.arguments});
  @override
  _NewGrowUpState createState() => _NewGrowUpState();
}

class _NewGrowUpState extends State<NewGrowUp> {
  final TextEditingController _controller = TextEditingController();
  Map _item;
  bool _isNew;
  bool _show = false;

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
          child: Row(children: [
            MediaButton(isCamera: true),
            SizedBox(width: 20),
            MediaButton(isCamera: false),
          ]))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      NavLayout(
          title: _isNew ? '创建成长记录' : '成长记录详情',
          backgroundColor: Colors.white,
          components: _isNew ? _renderNew() : _renderDetails(),
          bottom: _isNew
              ? InkWell(
                  onTap: () {},
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
                  ))
              : InkWell(
                  onTap: () {},
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text('分享',
                          style: style.baseFontStyle
                              .copyWith(fontWeight: FontWeight.bold))),
                )),
      if (_show)
        PhotoPreview(arguments: _item, handleOnClose: _handleClosePhoto),
    ]);
  }
}
