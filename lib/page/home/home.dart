import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/bloc/main_bloc.dart';
import 'package:flutter_bloc/model/home_model.dart';
import 'package:flutter_bloc/bloc/home_bloc.dart';
// import 'package:flutter_bloc/ui/widgets/home_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
     final _drawerKey = GlobalKey<ScaffoldState>();
    
     return  StreamBuilder(
      stream: bloc.outMoviesList,
      initialData: HomeModel.initData(),
      builder: (BuildContext context, AsyncSnapshot<HomeModel> snapshot){
        var vm = snapshot.data;
        return  Scaffold(
          key: _drawerKey,
          backgroundColor: Colors.black87,
          drawer: Drawer(
            child: Container(
              child: Text('333')
            )
          ),
          body: Column(
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.only(
                  top: MediaQuery
                      .of(context)
                      .padding
                      .top,
                  right: 5.0,
                ),
                height:63.0,
                child: new Row(
                  children: [
                      new Expanded(
                        flex: 3,
                        child: new Row(
                          children: <Widget>[
                            IconButton(
                              tooltip: 'Menu Icon',
                              icon: Icon(
                                  FontAwesomeIcons.alignLeft,
                                  size: 18.0,
                                  color: Colors.white
                              ),
                              onPressed: () {
                              _drawerKey.currentState.openDrawer();

                            },
                            ),
                            new Expanded(
                              child: new Text(
                                  'Let`s Go',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Dosis',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white
                                  )),
                            ),
                          ],
                        ),
                        ),
                      
                        IconButton(
                            icon: Icon(FontAwesomeIcons.bell),
                            iconSize: 20.0,
                            color: Colors.white,
                            tooltip: '告警',
                            onPressed: () {

                            },
                          ),
                      ],
                  ),
             ),
             Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height-63.0,
               color: Colors.white,
               child:  IconButton(
                  icon: Icon(Icons.headset_mic),
                  color: Colors.white,
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