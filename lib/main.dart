import 'package:a3_game/components/game.button.dart';
import 'package:a3_game/components/knight.state.dart';
import 'package:a3_game/model/knight.dart';
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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  AnimationController animationController, animationControllerJump;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
      //between 0 and 1
      value: 0.5,
    );
    animation = Tween<double>(
      begin: -200.0,
      end: 200.0,
    ).animate(animationController)
    ..addListener(() {
      setState(() {
         
      });
    });



  }

  Knight knight = Knight();
  var knightImage = 'images/knight.png';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff252525) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Transform.translate(
              offset: Offset(animation.value, 0),
              child: Image.asset(
                knightImage
              )
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GameButton(
                title: 'go left',
                color: Colors.green,
                onPressed: (){
                  animationController.reverse();
                  setState(() {
                    knightImage = 'images/knight-inverso.png';
                  });
                  // knight.direction = KnightState.left;
                }
              ),
              GameButton(
                title: 'stop',
                color: Colors.red,
                onPressed: (){
                  animationController.stop();
                  // knight.direction = KnightState.still;
                }
              ),
              GameButton(
                title: 'go right',
                color: Colors.green,
                onPressed: (){
                  animationController.forward();
                  setState(() {
                    knightImage = 'images/knight.png';
                  });
                  // knight.direction = KnightState.right;
                }
              ),
            ],
          ),
          GameButton(
            title: 'jump',
            color: Colors.blue,
            onPressed: (){
              
            }
          ),
        ],
      )
    );
  }
}

