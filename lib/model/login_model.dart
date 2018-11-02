import 'package:flutter/material.dart';
class LoginModel{
  double type;
  Color login;
  Color signIn;
  String text;
  bool isDarkTheme;
  String username;
  String password;
  double inputTop; // 输入框距离上部的距离
  int iconTypePassword;
  bool obscureText;
  bool loginLoadding; // 登陆等待
  double shadeHeight; // 遮罩高度
  double shadeWidth; // 遮罩宽度
  double radiusLoading; // 动态加载圆半径
  bool offStage; // 提示框显示 or 隐藏
  String modelContent; // 提示框内容

  LoginModel({
    this.type,
    this.login,
    this.signIn,
    this.text,
    this.isDarkTheme,
    this.username,
    this.password,
    this.inputTop,
    this.iconTypePassword,
    this.obscureText,
    this.loginLoadding,
    this.shadeHeight,
    this.shadeWidth,
    this.radiusLoading,
    this.offStage,
    this.modelContent
    });

     LoginModel.initial(
      { this.type = 3.0,
        this.login = Colors.black,
        this.signIn = Colors.white,
        this.text = '',
        this.isDarkTheme = false,
        this.username = '',
        this.password = '',
        this.inputTop = 260.0,
        this.iconTypePassword = 0,
        this.obscureText = true,
        this.loginLoadding = false,
        this.shadeHeight = 0.0,
        this.shadeWidth = 0.0,
        this.radiusLoading = 0.1,
        this.offStage = true,
        this.modelContent = '',
        });
}