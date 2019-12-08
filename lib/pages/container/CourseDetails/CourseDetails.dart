import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/services.dart';

class CourseDetails extends StatefulWidget {
  var arguments;
  CourseDetails({this.arguments});
  @override
  State<StatefulWidget> createState() {
    print('my arguments:$arguments');
    return _CourseDetailsState(arguments: arguments);
  }
}

class _CourseDetailsState extends State<CourseDetails> {
  var _arguments;
  var _courseId;
  _CourseDetailsState({arguments}) {
    this._arguments = arguments;
    this._courseId = arguments['courseId'];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: style.bgColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                  child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.fromLTRB(10, style.topPadding, 10, 10),
                      width: style.width,
                      height: 220,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon/banner2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      alignment: Alignment.topLeft,
                      child: Opacity(
                        opacity: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child:
                                  Image.asset('assets/icon/icon-dark-back.png'),
                            ),
                            InkWell(
                              onTap: () {
                                print('share');
                              },
                              child: Image.asset(
                                  'assets/icon/icon-dark-share.png'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text('寒假全期小/初/高数学辅导班',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0)),
                        ),
                        InkWell(
                          onTap: () {
                            print('like');
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            margin: EdgeInsets.fromLTRB(0, 10, 15, 0),
                            child: Image.asset(
                              'assets/icon/unfocus-on.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: style.width,
                      child: Column(
                        children: <Widget>[],
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
