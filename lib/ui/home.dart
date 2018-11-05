import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/bloc/main_bloc.dart';
import 'package:flutter_bloc/model/home_model.dart';
import 'package:flutter_bloc/bloc/home_provider.dart';
import 'package:flutter_bloc/ui/widgets/home_widget.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
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
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Center(
              child: Text('Let,Go', style: TextStyle(fontSize: 14.0),)
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 4.0),
                child:   IconButton(
                  icon: Icon(Icons.alarm),
                  tooltip: '告警',
                  onPressed: () {

                  },
                ),
              )
            
              
            ],
          ),
          drawer: Drawer(
            child: Container(
              child: Text('333')
            )
          ),
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
                 

                ]
              )
          
         

        );

      },
    );
   }
}