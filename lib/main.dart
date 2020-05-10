import 'package:a3_game/components/game.button.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double knightSize = 1;
  double knightPositionX = 0;
  double knightRotation = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff252525) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Transform.rotate(
              angle: ( knightRotation * 1.5 )/ 90,
              child: Transform.translate(
                offset: Offset( knightPositionX, 0 ),
                child: Transform.scale
                (
                  scale: knightSize,
                  child: Image.asset('images/knight.png')
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GameButton(
                title: '+ scale',
                color: Colors.blue,
                onPressed: (){
                  setState(() {
                    knightSize *= 1.5;
                  });
                },
              ),
              GameButton(
                title: '+ translate',
                color: Colors.red,
                onPressed: (){
                  setState(() {
                    knightPositionX += 10;
                  });
                },
              ),
              GameButton(
                title: '+ rotate',
                color: Colors.green,
                onPressed: (){
                  setState(() {
                    knightRotation += 45;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GameButton(
                title: '- scale',
                color: Color(0xff01253b),
                onPressed: (){
                  setState(() {
                    knightSize /= 1.5;
                  });
                },
              ),
              GameButton(
                title: '- translate',
                color: Color(0xff760000),
                onPressed: (){
                  setState(() {
                    knightPositionX -= 10;
                  });
                },
              ),
              GameButton(
                title: '- rotate',
                color: Color(0xff0c3b01),
                onPressed: (){
                  setState(() {
                    knightRotation -= 45;
                  });
                },
              ),
            ],
          ),
        ],
      )
    );
  }
}

