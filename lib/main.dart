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
      duration: Duration(milliseconds: 2000),
      vsync: this,
      //between 0 and 1
      value: 0.5
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

  @override
  Widget build(BuildContext context) {

    print(animation.value);

    return Scaffold(
      backgroundColor: Color(0xff252525) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Transform.translate(
              offset: Offset(animation.value, 0),
              child: Image.asset(
                'images/knight.png'
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
                }
              ),
              GameButton(
                title: 'stop',
                color: Colors.red,
                onPressed: (){
                  animationController.stop();
                }
              ),
              GameButton(
                title: 'go right',
                color: Colors.green,
                onPressed: (){
                  animationController.forward();
                }
              ),
            ],
          ),
          GameButton(
            title: 'jump',
            color: Colors.blue,
            onPressed: (){
              animationController.forward();
            }
          ),
        ],
      )
    );
  }
}

