import 'package:flutter/material.dart';
import 'package:flutter_puzzle/entity/game_model.dart';

class GameItem extends StatelessWidget {

  GameModel gameModel;


  GameItem(this.gameModel){


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      // constraints: BoxConstraints(
      //   minWidth: 30,
      //   maxWidth: 10,
      //   maxHeight: 20,
      //   minHeight: 20
      // ),
      height: 60,
      width: 60,
      color: () {
        switch(gameModel.pieces!){
          case PIECES.NOTHING: return Colors.yellow;
          case PIECES.INIT: return Colors.yellow;
          case PIECES.BOMB: return Colors.yellow;
          case PIECES.GEM: return Colors.yellow;
        }
      }(),
      child: () {
       switch(gameModel.pieces!){
         case PIECES.NOTHING: return Image.asset('/icon/bomb3.png',fit: BoxFit.fill,);
         case PIECES.INIT: return Image.asset('/icon/bomb2.png',fit: BoxFit.fill,);
         case PIECES.BOMB: return Image.asset('/icon/bomb3.png',fit: BoxFit.fill,);
         case PIECES.GEM: return Image.asset('/icon/gem.png',fit: BoxFit.fill,);
       }
      }(),
    );
  }
}
