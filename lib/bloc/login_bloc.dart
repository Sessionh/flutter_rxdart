import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/model/login_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class LoginBloc implements BlocBase {
  PublishSubject<LoginModel> _loginController = PublishSubject<LoginModel>();

  Sink<LoginModel> get _inLoginList => _loginController.sink;

  Stream<LoginModel> get outLoginList => _loginController.stream;
   

  @override
  void dispose() {
    _loginController.close();
  }
  Icon iconType (int iconTypePassword) {
      if (iconTypePassword == 0) {
        return Icon(Icons.visibility_off,color: Colors.black54);
      } else {
        return Icon(Icons.remove_red_eye,color: Colors.black54);
      }
      
  }
  

  setData({
    double type,
    Color login,
    Color signIn,
    String text,
    bool isDarkTheme,
    String userName,
    String password,
    double inputTop, // 输入框距离上部的距离
    int iconTypePassword,
    bool obscureText,
    bool loginLoadding, // 登陆等待
    double shadeHeight, // 遮罩高度
    double shadeWidth, // 遮罩宽度
    double radiusLoading, // 动态加载圆半径
    bool offStage, // 提示框显示 or 隐藏
    String modelContent, // 提示框内容
    Function result,
    }){

      double _type = 3.0;
      Color _login = Colors.black;
      Color _signIn = Colors.white;
      String _text = '';
      bool _isDarkTheme = false;
      String _userName = '';
      String _password = '';
      double _inputTop = 260.0;
      int _iconTypePassword = 0;
      bool _obscureText = true;
      bool _loginLoadding = false;
      double _shadeHeight = 0.0;
      double _shadeWidth = 0.0;
      double _radiusLoading = 0.1;
      bool _offStage = true;
      String _modelContent = '';
      if (type != null) {
        _type = type;
      }
      if (login != null) {
        _login = login;
      }
      if (signIn != null) {
        _signIn = signIn;
      }
      if (text != null) {
        _text = text;
      }
      if (isDarkTheme != null) {
        _isDarkTheme = isDarkTheme;
      }
      if (userName != null) {
        _userName = userName;
      }
      if (password != null) {
        _password = password;
      }
      if (inputTop != null) {
        _inputTop = inputTop;
      }
      if (iconTypePassword != null) {
        _iconTypePassword = iconTypePassword;
      }
      if (obscureText != null) {
        _obscureText = obscureText;
      }
      if (loginLoadding != null) {
        _loginLoadding = loginLoadding;
      }
      if (shadeHeight != null) {
        _shadeHeight = shadeHeight;
      }
      if (shadeWidth != null) {
        _shadeWidth = shadeWidth;
      }
      if (radiusLoading != null) {
        _radiusLoading = radiusLoading;
      }
      if (offStage != null) {
        _offStage = offStage;
      }
      if (modelContent != null) {
        _modelContent = modelContent;
      }
    LoginModel _main = new LoginModel(
      type: _type,
      login: _login,
      signIn: _signIn,
      text: _text,
      isDarkTheme: _isDarkTheme,
      username: _userName,
      password: _password,
      inputTop: _inputTop,
      iconTypePassword: _iconTypePassword,
      obscureText: _obscureText,
      loginLoadding: _loginLoadding,
      shadeHeight: _shadeHeight,
      shadeWidth: _shadeWidth,
      radiusLoading: _radiusLoading,
      offStage: _offStage,
      modelContent: _modelContent,
      );
    
      _inLoginList.add(_main);

  }
  
  
  
}
