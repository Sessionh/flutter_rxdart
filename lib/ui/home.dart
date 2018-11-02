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
        return  Scaffold(
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child:  new IconButton(
                  icon: Icon(Icons.headset_mic),
                  onPressed: () {
                    main.setIsLogin(false);
                      bloc.setTestData();
                  }
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:10.0),
                child: Text('333${snapshot.data.title}, ${snapshot.data.isLogin}'),
              ),
              Padding(
                padding: EdgeInsets.only(top:10.0),
                child: HomeWidget(),
              )
              

            ]
          )
          
         

        );

      },
    );
   }
}