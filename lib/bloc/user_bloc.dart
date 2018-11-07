import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/model/user_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class UserBloc implements BlocBase {
  PublishSubject<UserModel> _moviesController = PublishSubject<UserModel>();

  Sink<UserModel> get _inList => _moviesController.sink;

  Stream<UserModel> get outList => _moviesController.stream;

  ReplaySubject<int> _movieId = ReplaySubject<int>();

  Sink<int> get movieId => _movieId.sink;
   
  UserBloc() { // 初始化
  
  }

  @override
  void dispose() {
    _moviesController.close();
    _movieId.close();
  }

  setData({double iconSize}) {
    UserModel user = new UserModel(iconSize: iconSize);
    _inList.add(user);
   

  }
  
}
