import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/model/user_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class UserBloc implements BlocBase {
  PublishSubject<UserModel> _moviesController = PublishSubject<UserModel>();

  Sink<UserModel> get _inList => _moviesController.sink;

  Stream<UserModel> get outList => _moviesController.stream;
  UserBloc() { // 初始化
  
  }

  @override
  void dispose() {
    _moviesController.close();
  }

  setData({double iconSize}) {
    UserModel user = new UserModel(iconSize: iconSize);
    _inList.add(user);
   

  }
  
}
