import 'package:flutter/cupertino.dart';

import '../entity/game_model.dart';
import '../util/random_numbers.dart';

class PuzzleProvider extends ChangeNotifier{
  List<GameModel> game_peices;
  bool isGameReady = false;

  PuzzleProvider(this.game_peices);

  void ChangeGameStatu(bool status, {bomb_count,  gem_count}){
   isGameReady = status;


   var gems_list = RandomNumbers.generateUniqueRandomNumbers(gem_count,0,24);
   var bomb_list = RandomNumbers.generateUniqueRandomNumbers(bomb_count,0,24,another_list: gems_list);
   print("gem: ${gems_list}");
   print("bomb_list: ${bomb_list}");
    notifyListeners();
  }

  void SetGamePieces(var index,PIECES pieces){
    print("Update game $index");
    game_peices[index].pieces = pieces;
   notifyListeners();
  }
  void UpdateGame(var index){
    print("Update game $index");
    game_peices[index].choosed = true;
   notifyListeners();
  }
}