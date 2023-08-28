import 'package:flutter/cupertino.dart';

import '../entity/game_model.dart';

class PuzzleProvider extends ChangeNotifier{
  List<GameModel> game_peices;

  PuzzleProvider(this.game_peices);

  void UpdateGame(var index,PIECES pieces){
    game_peices[index].pieces = pieces;
    notifyListeners();
  }
}