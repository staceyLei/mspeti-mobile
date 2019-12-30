import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'ButtonLink.dart';

class CommentsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      width: style.width,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('全网评价', style: TextStyle(fontSize: 12.0)),
              ButtonLink(
                title: '更多',
              ),
              SizedBox(height: 10.0,),
              
            ],
          ),
        ],
      ),
    );
  }
}
