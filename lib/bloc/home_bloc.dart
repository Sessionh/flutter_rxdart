import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/model/home_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class HomeBloc implements BlocBase {
  PublishSubject<HomeModel> _moviesController = PublishSubject<HomeModel>();

  Sink<HomeModel> get _inMoviesList => _moviesController.sink;

  Stream<HomeModel> get outMoviesList => _moviesController.stream;

  ReplaySubject<int> _movieId = ReplaySubject<int>();

  Sink<int> get movieId => _movieId.sink;
  Animation animation;
  AnimationController controller;
   
  HomeBloc() { // 初始化
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
  }

  @override
  void dispose() {
    _moviesController.close();
    _movieId.close();
    controller.dispose();
  }

  setData({int id, bool isLogin, String title}) {
    int _id = 1;
    bool _isLogin = false;
    String _title = '';
    if (id != null) {
      _id = id;
    }
    if (isLogin != null) {
      _isLogin = isLogin;
      print('参');
    }
    if (title != null) {
      _title = title;
    }
    print(isLogin);
  
    final home = HomeModel(id: _id, isLogin: _isLogin, title: _title);
    _inMoviesList.add(home);

  }
  setTestData() {
    final home = HomeModel(id: 1, isLogin: true, title: 'cc');
    _inMoviesList.add(home);

  }

  
}
