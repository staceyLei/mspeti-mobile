import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;

class CollectionItem extends StatelessWidget {
  final Map item;
  final bool status; //true 管理状态 false 完成状态
  final bool isSelected;
  final Function onCancel;
  CollectionItem(
      {@required this.item, this.status, this.isSelected, this.onCancel});

  Widget _renderColumn() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: style.baseRadius,
                image: DecorationImage(
                    image: AssetImage(item['img']), fit: BoxFit.cover)),
            width: 120,
            height: 120,
          ),
          SizedBox(width: 10),
          Expanded(
              flex: 1,
              child: Container(
                height: 120,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(item['name'],
                                maxLines: 2,
                                style: style.baseFontStyle
                                    .copyWith(fontSize: style.mFontSize)),
                            SizedBox(height: 10),
                            Text(item['info'],
                                maxLines: 1,
                                style: TextStyle(
                                    color: style.lightGrey,
                                    fontSize: style.baseFontSize)),
                          ]),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    '¥',
                                    style: TextStyle(
                                        color: style.redColor,
                                        fontSize: style.baseFontSize),
                                  ),
                                  Text(item['price'],
                                      style: TextStyle(
                                          color: style.redColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ]),
                            !status
                                ? InkWell(
                                  onTap:onCancel,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal:15),
                                    width: 48,
                                    height: 18,
                                    child: Image.asset(
                                        "assets/icon/collect-more.png",
                                        fit: BoxFit.contain),
                                  ),
                                )
                                
                                : SizedBox()
                          ]),
                    ]),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
      width: style.width,
      child: Row(children: [
        status
            ? Container(
                width: 18,
                height: 18,
                child: Image.asset(isSelected
                    ? "assets/icon/collect-select.png"
                    : "assets/icon/collect-unselect.png"))
            : SizedBox(),
        SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: _renderColumn(),
        ),
      ]),
    );
  }
}
