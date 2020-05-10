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
  Animation<Color> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 4500),
      vsync: this
    );

    animation = ColorTween(
      begin: Colors.red,
      end: Colors.blue
    ).animate(animationController)
    ..addListener(() {
      setState(() {
         
      });
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff252525) ,
      body: Center(
        child: Container(
          color: animation.value,
          height: 100,
          width: 100,
        )
      )
    );
  }
}

