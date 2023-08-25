import 'package:flutter/material.dart';
import 'package:flutter_puzzle/entity/game_model.dart';

class GameItem extends StatelessWidget {

  GameModel gameModel;


  GameItem(this.gameModel){

    switch(gameModel.pieces!){
      case PIECES.NOTHING: print("Nothing");
      case PIECES.INIT: print("INIT");
      case PIECES.BOMB: print("BOMB");
      case PIECES.GEM: print("GEM");
    //  case null: print("null");

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: () {
        switch(gameModel.pieces!){
          case PIECES.NOTHING: return Colors.yellow;
          case PIECES.INIT: return Colors.yellow;
          case PIECES.BOMB: return Colors.yellow;
          case PIECES.GEM: return Colors.yellow;
        }
      }(),
      height: 15,
      width: 15,
      child: () {
       switch(gameModel.pieces!){
         case PIECES.NOTHING: return Image.asset('/icon/bomb3.png',fit: BoxFit.fill,);
         case PIECES.INIT: return Image.asset('/icon/bomb3.png',fit: BoxFit.fill,);
         case PIECES.BOMB: return Image.asset('/icon/bomb3.png',fit: BoxFit.fill,);
         case PIECES.GEM: return Image.asset('/icon/gem.png',fit: BoxFit.fill,);
       }
      }(),
    );
  }
}
