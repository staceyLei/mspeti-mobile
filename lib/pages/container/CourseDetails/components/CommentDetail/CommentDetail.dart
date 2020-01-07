import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/services.dart';
import 'package:educationapp/pages/components/NavLayout.dart';
import 'components/CommentPanel.dart';
import 'components/const.dart';

class CommentDetail extends StatelessWidget {
  List<Widget> renderComment() {
    if (comment.length == 0) {
      return <Widget>[
        Container(
          width: style.width,
          child: Text("暂无评论~"),
        )
      ];
    } else {
      return comment.map((ele) => CommentPanel(
            headImg: ele['headImg'],
            name: ele['name'],
            date: ele['date'],
            star: ele['star'],
            content: ele['content'],
            commentImg: ele['commentImg'],
          )).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child:NavLayout(title:'课程评价',components: this.renderComment(),backgroundColor: Colors.white,),
    );
  }
}
