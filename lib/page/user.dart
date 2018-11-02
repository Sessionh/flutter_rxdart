import 'package:flutter/material.dart';
class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child:  new IconButton(
          icon: new Icon(Icons.accessibility),
          onPressed: () {
            
             Navigator.of(context).pushNamed("/login");
              // Scaffold.of(context).showSnackBar(
              //     SnackBar(
              //       content: new Text('333'),
              //       backgroundColor: Colors.black,
              //     )
              // );
          }
        )
      ),
    );
  }
}