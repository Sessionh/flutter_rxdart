import 'package:flutter/material.dart';
class Model extends StatelessWidget { // 一个弹出框

   const Model({
    Key key,
    this.isShow = true,
    this.but0nPressed,
    this.title = '',
    this.content = '',
   }) : assert(isShow != null),
       super(key: key);

  final bool isShow;
  final Function but0nPressed;
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Offstage( // 隐藏类型
      child:AlertDialog(
          title: Text(title, style: TextStyle(color: Colors.black54, fontSize: 14.0),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  content, 
                  style: TextStyle(color: Colors.black54, fontSize: 13.0),),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('确认'),
              onPressed: but0nPressed,
            ),
          ],
        ),
        offstage: isShow,
      );

  }

}