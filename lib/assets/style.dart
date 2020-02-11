import 'package:flutter/material.dart';
import 'dart:ui';

const bgColor = Color.fromRGBO(247, 248, 255, 1);
const bgGrey = Color.fromRGBO(241, 242, 243, 1);
const themeColor = Color.fromRGBO(37, 102, 177, 1);
const loadingColor = Color.fromRGBO(37, 102, 177, 0.3);
double width = MediaQueryData.fromWindow(window).size.width;
double height = MediaQueryData.fromWindow(window).size.height;
double topPadding = MediaQueryData.fromWindow(window).padding.top;
const borderColor = Color.fromRGBO(243, 243, 243, 1);
const redColor = Color.fromRGBO(255, 62, 48, 1);
const lightGrey = Color.fromRGBO(158, 158, 163, 1);
const grey = Color.fromRGBO(247, 247, 247, 1);
const sFontColor = Color.fromRGBO(105, 105, 112, 1);
BorderRadius baseRadius = BorderRadius.circular(5.0);
const baseFontSize = 14.0;
const sFontSize = 12.0;
const titleSize = 18.0;
const mFontSize = 16.0;
const secondFontColor = Color.fromRGBO(191, 191, 191, 1);
const baseFontColor = Color.fromRGBO(50, 49, 56, 1);
TextStyle baseFontStyle =
    TextStyle(color: baseFontColor, fontSize: baseFontSize);
TextStyle sFontStyle = TextStyle(color: baseFontColor, fontSize: sFontSize);
TextStyle mFontStyle = TextStyle(color: baseFontColor, fontSize: mFontSize);
TextStyle secondFontStyle =
    TextStyle(color: Color.fromRGBO(158, 158, 163, 1), fontSize: 13.0);
TextStyle hintStyle =
    TextStyle(color: Color.fromRGBO(158, 158, 163, 1), fontSize: baseFontSize);
const warnColor = Color.fromRGBO(255, 235, 210, 1);
const successColor = Color.fromRGBO(205, 255, 189, 1);
TextStyle femaleStyle = TextStyle(
    color: redColor,
    fontSize: sFontSize,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none);
TextStyle maleStyle = TextStyle(
    color: themeColor,
    fontSize: sFontSize,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none);
LinearGradient baseGradient = LinearGradient(colors: [
  Color.fromRGBO(0, 117, 255, 1),
  themeColor,
]);
