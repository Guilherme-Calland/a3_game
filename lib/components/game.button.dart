import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {

  String title;
  Color color;
  Function onPressed;

  GameButton({this.title, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        padding: EdgeInsets.all(15),
        color: color,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}