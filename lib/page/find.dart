import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Find extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => new _MyHomePageState();

}

class _MyHomePageState extends State<Find> {
  


   @override
  Widget build(BuildContext context) {

    bool _index = false;
    
    return Container(
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: new  BoxDecoration(
          image:  DecorationImage(image: AssetImage('images/Layer1.png'), fit: BoxFit.fill)
        ),
        child:  new CupertinoSwitch(
                value: _index,
                onChanged: (ev) {
                  setState(() {
                    _index = ev;
                  });

                },
              ),
      );
  }

}
