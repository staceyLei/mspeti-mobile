import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'CardItem.dart';

class CardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double top = style.height/8;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, top, 20, 0),
          child:Stack(
          alignment: Alignment.center,
        children:<Widget>[
          Positioned(
            child: Column(
            children: <Widget>[
              SizedBox(height:50),
              Container(
                height: 106,
                width: style.width-40,
                padding: EdgeInsets.only(bottom:15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top:Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage("assets/image/card-bg.png"),
                    fit: BoxFit.cover,
                    ),
                ),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:<Widget>[
                    Text('lili',style: TextStyle(color: Colors.white,fontSize:style.titleSize,fontWeight:FontWeight.bold,
                      decoration: TextDecoration.none
                    ),),
                    SizedBox(height:5),
                    Text('201625040411',style:TextStyle(
                      color: Colors.white,
                      fontSize:style.baseFontSize,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none
                    ))
                  ]
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical:10),
                decoration:BoxDecoration(
                  color:Colors.white,
                  border:Border(bottom: BorderSide(color:style.borderColor,width:0.5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 16,
                      height: 16,
                      child: Image.asset("assets/icon/icon-female.png",fit: BoxFit.contain,),),
                      SizedBox(width:5),
                    Text('16岁',style:style.femaleStyle),
                    SizedBox(width:5),
                    Text('广东省 广州市',style:style.femaleStyle),
                  ],
                ),
              ),
              Container(
                width:style.width-40,
                padding: EdgeInsets.all(15),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom:Radius.circular(20)),
                  color: Colors.white
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CardItem(title:'学习时长(分钟)',value:'100'),
                        CardItem(title:'课程数',value:'5'),
                        CardItem(title:'综合评价',value:'A'),
                      ],
                    ),
                    SizedBox(height:15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CardItem(title:'出勤率',value:'90%'),
                        CardItem(title:'收藏课程',value:'10'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
            ),
          Positioned(
            top: 0,
            child: ClipOval(
            child: Image.asset("assets/image/headImg.png",fit: BoxFit.cover,width: 80,height:80,),
          )
        ),
          
        ]
      ),
        
    );
  }
}
