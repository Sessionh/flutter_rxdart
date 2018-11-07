import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/bloc_provider.dart';
import 'package:flutter_bloc/bloc/user_bloc.dart';
import 'package:flutter_bloc/bloc/main_bloc.dart';
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
    final MainBloc main = BlocProvider.of<MainBloc>(context);
    

    return StreamBuilder(
      initialData: UserModel.init(),
      stream: bloc.outList,
      builder: (BuildContext context, AsyncSnapshot<UserModel> snap){
        var vm = snap.data;
        return Scaffold(
          body: LogoApp(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              main.setData(isLogin: false);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );

      },
    );
   
  }
}



class LogoApp extends StatefulWidget {
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 20.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {
              print(11166);

                });
      });
    controller.forward();
  }

  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: IconButton(
          iconSize: animation.value,
          icon: Icon(Icons.local_movies),
          onPressed: () {
    
           if (controller.isCompleted) {
             controller.reverse();
           } else {
             controller.forward();
           }
          },
        ),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // final random = new Random();
  int dataSet = 50;
  AnimationController animation;
  Tween<double> tween;

  @override
  void initState() {
    super.initState();
    animation = new AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this
    );
    // Tween({T begin, T end })：创建tween（补间）
    tween = new Tween<double>(begin: 0.0, end: dataSet.toDouble());
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      dataSet = 30;
      tween = new Tween<double>(
        /*
        @override
        T evaluate(
          Animation<double> animation
        )
        返回给定动画的当前值的内插值
        当动画值分别为0.0或1.0时，此方法返回begin和end
         */
        begin: tween.evaluate(animation),
        end: dataSet.toDouble()
      );
      animation.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
          child: new CustomPaint(
            size: new Size(200.0, 100.0),
            /*
            Animation<T> animate(
              Animation<double> parent
            )
            返回一个由给定动画驱动的新动画，但它承担由该对象确定的值
             */
            painter: new BarChartPainter(tween.animate(animation))
          )
        ),
        floatingActionButton: new FloatingActionButton(
            onPressed: changeData,
            child: new Icon(Icons.refresh),
        ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  static const barWidth = 10.0;

  BarChartPainter(Animation<double> animation)
      : animation = animation,
        super(repaint: animation);

  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final barHeight = animation.value;
    final paint = new Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;
    canvas.drawRect(
        new Rect.fromLTWH(
            size.width-barWidth/2.0,
            size.height-barHeight,
            barWidth,
            barHeight
        ),
        paint
    );
  }

  @override
  bool shouldRepaint(BarChartPainter old) => false;
}
