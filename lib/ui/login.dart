import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/bloc/main_bloc.dart';
import 'package:flutter_bloc/bloc/login_bloc.dart';
import 'package:flutter_bloc/model/login_model.dart';
import 'package:flutter_bloc/libs/util.dart';
import 'package:flutter_bloc/widgets/Model.dart';
import 'package:flutter_bloc/ui/widgets/login_type.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider<LoginBloc>(
        bloc: LoginBloc(),
        child: LoginApp(),
    );
    
  }
  
}

class LoginApp extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  void _forSubmitted() {
    var _form = formKey.currentState;
    if (_form.validate()) {
      _form.save();
    } 
  }
  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    

    return  Scaffold(
          body: StreamBuilder(
            stream: loginBloc.outLoginList,
            initialData: loginBloc.loginInitData,
            builder: (BuildContext context, AsyncSnapshot<LoginModel> snapshot){
              var vm = snapshot.data;
              print(vm.isDarkTheme);

              return Stack(
                children: <Widget>[
                  SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 600.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 0.0),
                                padding: EdgeInsets.only(top: 160.0),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                decoration: new  BoxDecoration(
                                  image:  DecorationImage(image: AssetImage('images/logos8.png'), fit: BoxFit.fill),
                                  color: Colors.green
                                ),
                                child: new Column(
                                  children:  <Widget>[
                                    new Padding(
                                      padding: EdgeInsets.only(top:30.0),
                                      child: new Text('33${vm.loginLoadding}')

                                    ),
                                    new Padding(
                                      padding: EdgeInsets.only(top: 50.0),
                                      child: LoginType(),
                                    ),
                                    new Stack(
                                      children: <Widget>[
                                        new Padding(
                                          padding: EdgeInsets.only(top: 10.0),
                                          child: new Container(
                                            padding: EdgeInsets.all(8.0),
                                            width: MediaQuery.of(context).size.width - 75.0,
                                            height: 200.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                              color: Colors.white,
                                            ),
                                            child: new Center(
                                              child:  _loginForm(vm.username, vm.password, vm.isDarkTheme, vm.obscureText, vm.iconTypePassword, loginBloc)
                                            ),
                                          ),
                                        ),
                                        new Container(
                                          width: MediaQuery.of(context).size.width - 75.0,
                                          padding: EdgeInsets.only(top: 20.0),
                                          child: new Padding(
                                            padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 165.0),
                                            child:  new CupertinoButton(
                                              color: Colors.blue[400],
                                              pressedOpacity: 0.0,
                                              child: new Text('登陆'),
                                              onPressed: () {
                                                _forSubmitted(); // save form
                                                
                                                  if (vm.username == '' &&  vm.password == '') {
                                                    loginBloc.setData(
                                                      modelContent: '用户名和密码不能为空',
                                                      offStage: false,
                                                    );

                                                  } else if (vm.username != '' && vm.password == '') {
                                                    
                                                    loginBloc.setData(
                                                      modelContent: '密码不能为空',
                                                      offStage: false,
                                                    );

                                                  } else if (vm.username == '' && vm.password != '') {
                                                    loginBloc.setData(
                                                      modelContent: '用户名不能为空',
                                                      offStage: false,
                                                    );

                                                  } else {
                                                    loginBloc.setData(
                                                      shadeHeight: MediaQuery.of(context).size.height,
                                                      shadeWidth:  MediaQuery.of(context).size.width,
                                                      radiusLoading: 30.0,
                                                      loginLoadding: true,
                                                    );
                                                    
                                              
                                                
                                                    Util.setTimeOut(2, () {
                                                      
                                                      loginBloc.setData(
                                                        shadeHeight: 0.0,
                                                        shadeWidth:  0.0,
                                                        radiusLoading: 0.1,
                                                        loginLoadding: false,
                                                      );
                                                    
                                                      // Navigator.pushNamed(context, '/home');

                                                    });

                                                  }

                                              }
                                          ),
                                          )
                                        
                                        ),
                                    

                                      ],

                                    ),
                                  
                                    
                                  ],
                                ),
                              )
                                  
                                ],
                              ),
                            ),

                        ),
                        new Model(
                          isShow: vm.offStage,
                          title: '提示内容',
                          content: vm.modelContent,
                          but0nPressed: () {
                            loginBloc.setData(offStage: true);
                        
                        }),
                      
                        new Container(
                          height: vm.shadeHeight,
                          width: vm.shadeWidth,
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          child: new Center(
                            child: new CupertinoActivityIndicator(
                              animating: vm.loginLoadding,
                              radius: vm.radiusLoading,
                            ),
                            ),
                        ),

                ],
             );

            },
          )
        );
  }

   Widget loginSignType(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
      
     return StreamBuilder(
       initialData: loginBloc.loginInitData,
       builder:  (BuildContext context, AsyncSnapshot<LoginModel> snapshot){
         var vm = snapshot.data;
         
         return Stack(
          children: <Widget>[
            new Container(
              height: 40.0,
              width: 200.0,
              padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                color: Color.fromRGBO(0, 0, 0, 0.3)
              ),
            ),
            new Container(
              height: 34.0,
              width: 100.0,
              margin: EdgeInsets.fromLTRB(vm.type, 3.0, 0.0, 3.0),
              padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                color: Colors.white
              )
            ),
            new Container(
              height: 40.0,
              width: 200.0,
              padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
              child: new Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      loginBloc.setData(type:3.0,login: Colors.black);
                     
                    },
                    child: Text(
                      "登陆",
                      style: TextStyle(
                          color: vm.login,
                          fontSize: 16.0,
                          fontFamily: "WorkSansSemiBold"),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      // loginBloc.setData(
                      //   type: 97.0,
                      //   login: Colors.white,
                      //   signIn: Colors.black
                      // );
                       
                    },
                    child: Text(
                      "注册",
                      style: TextStyle(
                          color: vm.signIn,
                          fontSize: 16.0,
                          fontFamily: "WorkSansSemiBold"),
                    ),
                  ),
                ),
              ],
            ),
            ),

          ]

      );
    }
      

     );
     
      

   }
  _loginForm(String username, String password, bool isDarkTheme, bool obscureText, int iconTypePassword,loginBloc) =>  Form(
              key: formKey,
              onChanged: () {
                print(33);
              
              },
              autovalidate: false, //开启验证input
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Row(
                    children: <Widget>[
                      new Container(
                      child: new Icon(Icons.person, color: Colors.black54),
                      width: 60.0,
                    ),
                    new Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(labelText: '用户名', border: InputBorder.none),
                          // validator: (val) =>
                          //     val.length < 1 ? '用户名不能为空' : null,
                          onSaved: (val) => username = val,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          style: TextStyle(
                              color: isDarkTheme
                                  ? Colors.white
                                  : Colors.black),
                        ),
                    )

                    ]
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 25.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 0.3, color: Colors.lightBlue.shade900),
                      ),
                    ),
                  ),
                  
                  Row(
                    children: <Widget>[
                      new Container(
                        child: new Icon(Icons.https, color: Colors.black54),
                        width: 60.0,
                      ),
                      new Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: '密码',
                            border: InputBorder.none
                          ),
                          obscureText: obscureText, // 是否显示
                          // validator: (val) {
                          //   if (val.length < 1) {
                          //     return '密码不能为空';
                          //   } else {
                          //     return null;
                          //   }

                          // },
                          onSaved: (val) => password = val,
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          style: TextStyle(
                              color: isDarkTheme
                                  ? Colors.white
                                  : Colors.black
                          ),
                        ),
                      ),
                      new Container(
                        child: new IconButton(
                          icon: loginBloc.iconType(iconTypePassword),
                          onPressed: () {
                            if (iconTypePassword == 0) {
                              loginBloc.setData(iconTypePassword: 1, obscureText: false);
                            } else {
                              loginBloc.setData(iconTypePassword: 0, obscureText: true);
                            }

                          },

                        ),
                        
                        width: 60.0,
                      ),

                    ]
                  ),
                
                ],
              ),
            );
  
}

