import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/model/home_model.dart';
import 'package:flutter_bloc/bloc/home_bloc.dart';
class HomeWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){

     final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
     return  StreamBuilder(
      stream: bloc.outMoviesList,
      initialData: HomeModel.initData(),
      builder: (BuildContext context, AsyncSnapshot<HomeModel> snapshot){
        return  Container(
          height: 100.0,
          child: Column(
            children: <Widget>[
               new IconButton(
                  icon: Icon(Icons.call_end, size: 36.0,),
                  onPressed: () {
                    bloc.setData(title: '测试');
                    
                  }
                ),
                 Padding(
                  padding: EdgeInsets.only(top:10.0),
                  child: Text('333${snapshot.data.title}'),
                )

            ]
          )
          
         
          
        );
        

      },
    );

  }
}