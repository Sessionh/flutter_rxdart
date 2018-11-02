class HomeModel {
  final int id;
  final String title;
  final bool isLogin;

  HomeModel(
      {this.id,  this.title, this.isLogin});
  
  HomeModel.initData({
    this.id: 1,
    this.title: 'Test',
    this.isLogin: false,
  });

  HomeModel.fromJSON(Map<String, dynamic> json)
  : id = json['id'],
    title = json['title'],
    isLogin = json['isLogin'];

}


