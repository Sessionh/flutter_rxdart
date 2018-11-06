import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/bloc/main_bloc.dart';
import 'package:flutter_bloc/bloc/login_bloc.dart';
import 'package:flutter_bloc/model/login_model.dart';
import 'package:flutter_bloc/libs/util.dart';
import 'package:flutter_bloc/common_widgets/Model.dart';
import 'package:flutter_bloc/ui/widgets/login_type.dart';
import 'package:flutter_bloc/ui/widgets/login_form.dart';

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

    return StreamBuilder(
            stream: loginBloc.outLoginList,
            initialData: LoginModel.initial(),
            builder: (BuildContext context, AsyncSnapshot<LoginModel> snapshot){
              var vm = snapshot.data;             
              return Scaffold(
                      body: Stack(
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
                                      ),
                                      child: new Column(
                                        children:  <Widget>[
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
                                                    child:  LoginForm(formKey)
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
                                                      FocusScope.of(context).requestFocus(new FocusNode());
                                                      
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
                                                            bloc.setData(isLogin: true);
                                                            
                                                          
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
                  ),
                  
          );

        },
      );
  }
  
  
}

