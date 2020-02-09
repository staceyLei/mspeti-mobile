import 'package:flutter/material.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/services.dart';

class BaseInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool enabled;
  final String title;
  final String hintText;
  final List<TextInputFormatter> formatters;
  final TextInputType keyboardType;

  BaseInput(
      {this.controller,
      this.focusNode,
      this.enabled,
      this.title,
      this.formatters,
      this.keyboardType,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: style.borderColor, width: 1),
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(title, style: style.mFontStyle),
          Expanded(
              flex: 1,
              child: TextField(
                keyboardType: keyboardType,
                controller: controller,
                focusNode: focusNode,
                enabled: enabled,
                textAlign: TextAlign.end,
                inputFormatters: formatters,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    hintStyle:
                        style.hintStyle.copyWith(fontSize: style.mFontSize),
                    hintText: hintText),
              )),
        ],
      ),
    );
  }
}
