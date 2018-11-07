import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return  Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 83.0,
            // color: Color.fromRGBO(21, 21, 21, 0.8),
            child:  Column(
              children: <Widget>[
                iconRows(
                  context,
                  Icon(FontAwesomeIcons.assistiveListeningSystems),
                  Icon(FontAwesomeIcons.affiliatetheme),
                  'FLIGHT',
                  'FLIGHTs',
                ),
                Container(
                  height: 1.0,
                  width: MediaQuery.of(context).size.width,
                ),
                iconRows(
                  context,
                  Icon(FontAwesomeIcons.anchor),
                  Icon(FontAwesomeIcons.bug),
                  'FLIGHT1',
                  'FLIGHTs',
                ),
                Container(
                  height: 1.0,
                  width: MediaQuery.of(context).size.width,
                ),
                iconRows(
                  context,
                  Icon(FontAwesomeIcons.asymmetrik),
                  Icon(FontAwesomeIcons.lightbulb),
                  'FLIGHT2',
                  'FLIGHTs',
                ),
              ],
            )
            
          );
  }
  iconRows(BuildContext context, Icon iconLeft,Icon iconRight, String textLeft, String textRight) => Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height:  (MediaQuery.of(context).size.height - 85.0)/3,
                color: Color.fromRGBO(21, 21, 21, 0.8),
                child: Center(
                  child: iconState(iconLeft, textLeft),
                )
                
              ),
            ),
            Container(
                width: 1.0,
                height: 100.0,
            ),
            Expanded(
              child: Container(
                height:  (MediaQuery.of(context).size.height - 85.0)/3,
                color: Color.fromRGBO(21, 21, 21, 0.8),
                child: Center(
                  child: iconState(iconRight, textRight),
                )
              ),
            )
          ],
        );
  iconState(Icon icon, String text) =>Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child:  IconButton(
            icon:  icon,
            color: Color.fromRGBO(114, 74, 158, 1.0),
            iconSize: 59.0,
            onPressed: () {
              print(33);
            },
          )
        ),
        Padding(
          padding: EdgeInsets.only(top: 78.0, left: 8.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15.0,
              fontWeight: FontWeight.w300
            )
          ),
        )
        
      ],
    );
    
}