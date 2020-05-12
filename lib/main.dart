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

  AnimationController moveAnimationController, jumpAnimationController, legsAnimationController;
  Animation<double> moveAnimation, jumpAnimation, legsAnimation;

  @override
  void initState() {
    super.initState();
    getMoveAnimation();
    getJumpAnimation();
    getLegsAnimation();
  }

  @override
  void dispose(){
    super.dispose();
    moveAnimationController.dispose();
    jumpAnimationController.dispose();
    legsAnimationController.dispose();
  }

  Knight knight = Knight();
  var knightImage = 'images/knight.png';

  //physics
  
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
              offset: Offset(moveAnimation.value, -d ),
              child: Image.asset(
                knightImage,
                height: 80
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
                  moveAnimationController.reverse();
                  legsAnimationController.repeat();
                  setState(() {
                    knightImage = 'images/knight-inverso.png';
                    // knight.state = KnightState.left;
                    knight.facingLeft = true;
                  });
                }
              ),
              GameButton(
                title: 'stop',
                color: Colors.red,
                onPressed: (){
                  moveAnimationController.stop();
                  legsAnimationController.stop();
                  setState(() {
                    // knight.state = KnightState.still;
                    knightImage = knight.facingLeft ? 
                    'images/knight-inverso.png' :
                    'images/knight.png';
                  });
                }
              ),
              GameButton(
                title: 'go right',
                color: Colors.green,
                onPressed: (){
                  moveAnimationController.forward();
                  legsAnimationController.repeat();
                  setState(() {
                    knightImage = 'images/knight.png';
                    // knight.state = KnightState.right;
                    knight.facingLeft = false;
                  });
                }
              ),
            ],
          ),
          GameButton(
            title: 'jump',
            color: Colors.blue,
            onPressed: (){
              jumpAnimationController.forward();
              legsAnimationController.stop();
              setState(() {

              });
            }
          ),
        ],
      )
    );
  }

  void getLegsAnimation() {
    legsAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    legsAnimation = Tween<double>(
      begin: 0,
      end: 200,
    ).animate(legsAnimationController)
    ..addListener(() {
      setState(() {
      });
      legsAnimation.value >= 100 ?
      (
        knight.facingLeft ?
        knightImage = 'images/knight-inverso-legUp1.png' :
        knightImage = 'images/knight-legUp1.png'
      ) :
      (
        knight.facingLeft ?
        knightImage = 'images/knight-inverso-legUp2.png' :
        knightImage = 'images/knight-legUp2.png'
      );
    });
  }

  void getJumpAnimation() {
    jumpAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
      //between 0 and 1
      value: 0.0,
    );
    jumpAnimation = Tween<double>(
      begin: 0,
      end: 500,
    ).animate(jumpAnimationController)
    ..addListener(() { 
      setState(() {
         
      });

      double d0 = 0;
      double v0 = 0.5;
      double vf = -0.5;
      double t0 = 0;
      double tf = 500;
      double a = -1/ 500;

      t = jumpAnimation.value;
      v = v0 + a*t;
      d = d0 + v0*t + a*t*t/2;
      
      print('value of d: ' + d.toString());
      print('value of t: ' + t.toString());
      print('value of v: ' + v.toString());
      print('');
    
      if(jumpAnimationController.isCompleted){
        if(moveAnimationController.isAnimating){
          legsAnimationController.repeat();
        }
        jumpAnimationController.reset();
      }
      
    });
  }

  void getMoveAnimation() {
    moveAnimationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
      //between 0 and 1
      value: 0.5,
    );
    moveAnimation = Tween<double>(
      begin: -200,
      end: 200,
    ).animate(moveAnimationController)
    ..addListener(() { 
      setState(() {
         
      });
      
    });
  }
}

