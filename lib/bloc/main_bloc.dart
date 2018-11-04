import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/model/main_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dio/dio.dart';

class MainBloc implements BlocBase {
  PublishSubject<MainModel> _mainController = PublishSubject<MainModel>();

  Sink<MainModel> get _inMoviesList => _mainController.sink;

  Stream<MainModel> get outMoviesList => _mainController.stream;
  Dio http = new Dio();

   
  MainBloc() { // 初始化
    initData();
  }

  @override
  void dispose() {
    _mainController.close();
  }

  setData({bool isLogin,bool isLoading, String title}) {
    var _isLogin = false;
    var _isLoading = false;
    var _title = '';
    if (isLogin != null) {
      _isLogin = isLogin;
    }
    if (isLoading != null) {
      _isLoading = isLoading;
    }
    if (title != null) {
      _title = title;
    }
    MainModel main = new MainModel(isLogin: _isLogin, title: _title,isLoading: _isLoading);
    _inMoviesList.add(main);

  }
  setIsLogin(bool isLogin) {
     MainModel main = new MainModel(isLogin: isLogin);
    _inMoviesList.add(main);
  }

  void initData() {
    MainModel main = new MainModel(isLogin: false, isLoading: false, title: '测试');
    _inMoviesList.add(main);

  }
  Future<MainModel> fetchUpcomingMovies() async {

    return MainModel(title: '下手');
  }

  

  
}
