import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/bloc/user_bloc.dart';
import 'package:flutter_bloc/model/user_model.dart';
class User extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return BlocProvider<UserBloc>(
      bloc: UserBloc(),
      child: UserApp(),
    );
  }
}
class UserApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final UserBloc bloc = BlocProvider.of<UserBloc>(context);
    

    return StreamBuilder(
      initialData: UserModel.init(),
      stream: bloc.outList,
      builder: (BuildContext context, AsyncSnapshot<UserModel> snap){
        var vm = snap.data;
        return AnimationDemoHome();
        
        // Scaffold(
        //   body:   Center(
        //     child: Text('33'),
        //   ),
          
         
        //   floatingActionButton: FloatingActionButton(
        //     onPressed: () {
        //       bloc.setData(iconSize: 33.0);

        //     },
        //     tooltip: 'Increment',
        //     child: Icon(Icons.add),
        //   ),
        // );

      },
    );
   
  }
}



class AnimationDemoHome extends StatefulWidget  {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationDemoController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;
  
  

  @override
  void initState() {
    super.initState();

    animationDemoController = AnimationController(
      value: 32.0,
      lowerBound: 32.0,
      upperBound: 100.0,
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    curve = CurvedAnimation(
        parent: animationDemoController, curve: Curves.bounceOut);

    animation = Tween(begin: 32.0, end: 120.0).animate(curve);
    animationColor =
        ColorTween(begin: Colors.red, end: Colors.red[900]).animate(curve);

    

    animationDemoController.forward();
  }

  @override
  void dispose() {
    super.dispose();

    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedHeart(
        animations: [
          animation,
          animationColor,
        ],
        controller: animationDemoController,
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({
    this.animations,
    this.controller,
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default:
            controller.forward();
        }
      },
    );
  }
}
