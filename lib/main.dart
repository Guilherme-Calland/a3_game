import 'dart:ffi';

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

class _HomeState extends State<Home> with TickerProviderStateMixin{

  AnimationController animationController, jumpAnimationController;
  Animation<double> animation, jumpAnimation;

  int animationTime = 200;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: animationTime*10),
      vsync: this,
      //between 0 and 1
      value: 0.5,
    );
   jumpAnimationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
      //between 0 and 1
      value: 0.0,
    );

    animation = Tween<double>(
      begin: -animationTime.toDouble(),
      end: animationTime.toDouble(),
    ).animate(animationController)
    ..addListener(() { 
      setState(() {
         
      });
      
    });
    jumpAnimation = Tween<double>(
      begin: 0,
      end: 500,
    ).animate(jumpAnimationController)
    ..addListener(() { 
      setState(() {
      });
      t = jumpAnimation.value;
      v = v0 + a*t;
      d = d0 + v0*t + a*t*t/2;
      
      print('value of d: ' + d.toString());
      print('value of t: ' + t.toString());
      print('value of v: ' + v.toString());
      print('');

      if(jumpAnimationController.isCompleted)
      {
        jumpAnimationController.reset();
      }


    });
  }
  
  @override
  void dispose(){
    super.dispose();
    animationController.dispose();
    jumpAnimationController.dispose();
  }

  Knight knight = Knight();
  var knightImage = 'images/knight.png';

  //physics of the jump
  double d0 = 0;
  double v0 = 0.5;
  double vf = -0.5;
  double t0 = 0;
  double tf = 500;
  double a = -1/ 500;
  double t,v,d = 0;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff252525) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Transform.translate(
              offset: Offset(animation.value, -d ),
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
              jumpAnimationController.forward();
              
            }
          ),
        ],
      )
    );
  }
}

