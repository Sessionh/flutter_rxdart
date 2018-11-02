import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/login_bloc.dart';
import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/model/login_model.dart';


class LoginType extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    return StreamBuilder(
       initialData: LoginModel.initial(),
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
                      loginBloc.setData(
                        type: 97.0,
                        login: Colors.white,
                        signIn: Colors.black
                      );
                       
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


}