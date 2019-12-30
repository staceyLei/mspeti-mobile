import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final bool obscureText;
  final handleOnChanged;
  final prefixIcon;
  final hintText;
  final bool suffixIcon;
  final inputVal;
  final handleClean;

  MyTextField(
      {@required this.inputVal,
      this.handleClean,
      this.handleOnChanged,
      this.hintText,
      this.obscureText = false,
      this.prefixIcon,
      @required this.suffixIcon,
      Key key});
  @override
  State<StatefulWidget> createState() {
    return _MyTextFieldState(
        inputVal: this.inputVal,
        handleClean: this.handleClean,
        handleOnChanged: this.handleOnChanged,
        hintText: this.hintText,
        obscureText: this.obscureText,
        prefixIcon: this.prefixIcon,
        suffixIcon: this.suffixIcon);
  }
}

class _MyTextFieldState extends State<MyTextField> {
  final _controller = TextEditingController();
  final bool obscureText;
  final handleOnChanged;
  final prefixIcon;
  final hintText;
  bool suffixIcon;
  final inputVal;
  final handleClean;

  _MyTextFieldState(
      {@required this.inputVal,
      this.handleClean,
      this.handleOnChanged,
      this.hintText,
      this.obscureText = false,
      this.prefixIcon,
      @required this.suffixIcon});

  onCancel(controller) {
    // 保证在组件build的第一帧时才去触发取消清空内容
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.clear());
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this._controller,
      onChanged: (v) {
        print('v:$v');
        print(this.handleOnChanged);
        this.handleOnChanged(v);
      },
      style: TextStyle(fontSize: 16.0, color: Colors.black),
      obscureText: this.obscureText,
      decoration: InputDecoration(
          prefixIcon: this.prefixIcon,
          suffixIcon: this.suffixIcon && this.inputVal.length > 0
              ? IconButton(
                  icon: Image.asset('assets/icon/circle-cancel.png'),
                  onPressed: () {
                    handleClean();
                    onCancel(this._controller);
                  },
                )
              : null,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black54,
                  style: BorderStyle.solid)), //获取焦点时，下划线的样式
          hintText: this.hintText),
    );
  }
}
