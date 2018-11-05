import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/bloc/main_bloc.dart';
import 'package:flutter_bloc/model/main_model.dart';
import 'package:flutter_bloc/ui/home.dart';
import 'package:flutter_bloc/ui/login.dart';
import 'package:flutter_bloc/page/user.dart';
void main() {
  runApp(BlocProvider<MainBloc>(
    bloc: MainBloc(),
    child: MyApp(),
  )
    
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter bloc',
      home: StreamBuilder(
        stream: bloc.outMoviesList,
        initialData: new MainModel(isLogin: false),
        builder: (BuildContext context, AsyncSnapshot<MainModel> snapshot) {
          var result = snapshot.data;
          return result.isLogin ? Home() : Login();
        }

      )
      
    );
  }
}




