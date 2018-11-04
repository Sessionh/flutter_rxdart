import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/bloc/main_bloc.dart';
import 'package:flutter_bloc/model/home_model.dart';
import 'package:flutter_bloc/bloc/home_provider.dart';
import 'package:flutter_bloc/ui/widgets/home_widget.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // bloc.setIsLogin(false);
    return BlocProvider<HomeBloc>(
      bloc: HomeBloc(),
      child: HomeApp(),
    );
    
    
   
  }

  
}
class HomeApp extends StatelessWidget {
 
  
   @override
   Widget build(BuildContext context) {
     final MainBloc main = BlocProvider.of<MainBloc>(context);
     final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
     return  StreamBuilder(
      stream: bloc.outMoviesList,
      initialData: HomeModel.initData(),
      builder: (BuildContext context, AsyncSnapshot<HomeModel> snapshot){
        var vm = snapshot.data;
        return  Scaffold(
          body:  Container(
                                margin: EdgeInsets.only(bottom: 0.0),
                                padding: EdgeInsets.only(top: 160.0),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                decoration: new  BoxDecoration(
                                  image:  DecorationImage(image: AssetImage('images/logos8.png'), fit: BoxFit.fill),
                                  color: Colors.green
                                ),
                                child: TextFormField(
                                    decoration: InputDecoration(labelText: '用户名', border: InputBorder.none),                                   
                                    onSaved: (val) => vm.title = val,
                                    obscureText: false,
                                    keyboardType: TextInputType.text,
                                    autocorrect: false,
                                    style: TextStyle(color: Colors.black),
                                  ),

          )
          
          // Column(
          //   children: <Widget>[
          //     Padding(
          //       padding: EdgeInsets.only(top: 30.0),
          //       child:  new IconButton(
          //         icon: Icon(Icons.headset_mic),
          //         onPressed: () {
          //           main.setIsLogin(false);
          //             bloc.setTestData();
          //         }
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.only(top:10.0),
          //       child: Text('333${snapshot.data.title}, ${snapshot.data.isLogin}'),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.only(top:10.0),
          //       child: HomeWidget(),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.only(top:20.0),
          //       child: TextFormField(
          //           decoration: InputDecoration(labelText: '用户名', border: InputBorder.none),
          //           // validator: (val) =>
          //           //     val.length < 1 ? '用户名不能为空' : null,
          //           onSaved: (val) => vm.title = val,
          //           obscureText: false,
          //           keyboardType: TextInputType.text,
          //           autocorrect: false,
          //           style: TextStyle(color: Colors.black),
          //         ),
          //     )
              

          //   ]
          // )
          
         

        );

      },
    );
   }
}