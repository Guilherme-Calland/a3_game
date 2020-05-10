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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this
    );

    animation = Tween<double>(
      begin: 0.0,
      end: 5.0
    ).animate(animationController)
    ..addListener(() {
      setState(() {
         
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff252525) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Transform.scale(
              scale: 1 + animation.value,
              child: Image.asset(
                'images/knight.png'
              )
            )
          ),
          GameButton(
            title: 'start animation',
            color: Colors.green,
            onPressed: (){
              animation.value == 0 ?
              animationController.forward() :
              animationController.reverse(from: animation.value/5);
            },

          )
        ],
      )
    );
  }
}

