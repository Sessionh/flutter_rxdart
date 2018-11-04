import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/login_bloc.dart';
import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/model/login_model.dart';


class LoginForm extends StatelessWidget{
  final formKey;
  LoginForm(this.formKey);
  
  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    return StreamBuilder(
      stream: loginBloc.outLoginList,
       initialData: LoginModel.initial(),
       builder:  (BuildContext context, AsyncSnapshot<LoginModel> snapshot){
         var vm = snapshot.data;
         
         return                 
         Form(
              key: formKey,
              onChanged: () {               
              
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
                          onSaved: (val) => vm.username = val,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          style: TextStyle(
                              color: vm.isDarkTheme
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
                          obscureText: vm.obscureText, // 是否显示
                          // validator: (val) {
                          //   if (val.length < 1) {
                          //     return '密码不能为空';
                          //   } else {
                          //     return null;
                          //   }

                          // },
                          onSaved: (val) => vm.password = val,
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          style: TextStyle(
                              color: vm.isDarkTheme
                                  ? Colors.white
                                  : Colors.black
                          ),
                        ),
                      ),
                      new Container(
                        child: new IconButton(
                          icon: loginBloc.iconType(vm.iconTypePassword),
                          onPressed: () {
                            if (vm.iconTypePassword == 0) {
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
  );
  }


}