import 'package:a3_game/components/knight.state.dart';

class Knight{
  KnightState state;
  bool facingLeft;

  Knight(){
    state = KnightState.still;
    facingLeft = false;
  }
}