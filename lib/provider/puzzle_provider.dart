import 'package:flutter/cupertino.dart';

import '../entity/game_model.dart';

class PuzzleProvider extends ChangeNotifier{
  List<GameModel> game_peices;

  PuzzleProvider(this.game_peices);

  void SetGamePieces(var index,PIECES pieces){
    //print("Update game $index");
    game_peices[index].pieces = pieces;
    notifyListeners();
  }
  void UpdateGame(var index){
    print("Update game $index");
    game_peices[index].choosed = true;
    notifyListeners();
  }
}