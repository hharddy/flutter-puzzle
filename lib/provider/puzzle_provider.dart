import 'package:flutter/cupertino.dart';

import '../constant/string/const_string.dart';
import '../entity/game_model.dart';
import '../util/alert/show_dialog.dart';
import '../util/random_numbers.dart';

class PuzzleProvider extends ChangeNotifier{
  List<GameModel> game_peices;
  bool isGameReady = false;
  String win_or_lose = '';


  int founded_gem = 0;
  int founded_bomb = 0;
  int choosed_items = 0;

  int? all_gem;
  int? all_bomb;

  PuzzleProvider(this.game_peices);

  void ChangeGameStatus(bool status, {bomb_count,  gem_count}){
   isGameReady = status;
  all_bomb = bomb_count;
  all_gem = gem_count;

   var gems_list = RandomNumbers.generateUniqueRandomNumbers(gem_count,0,23);
   var bomb_list = RandomNumbers.generateUniqueRandomNumbers(bomb_count,0,23,another_list: gems_list);

   for(int i =0;i<game_peices.length;i++){

     if(gems_list.contains(i))   game_peices[i].pieces = PIECES.GEM;
     else if(bomb_list.contains(i)) game_peices[i].pieces = PIECES.BOMB;
     else game_peices[i].pieces = PIECES.NOTHING;

     if(win_or_lose.length>3) game_peices[i].choosed=false;
   }
    win_or_lose  = '';
    founded_gem = 0;
    founded_bomb = 0;



    notifyListeners();
  }


  void UpdateGame(var index){
    print("Update game $index ${game_peices[index].pieces}");
    game_peices[index].choosed = true;
    choosed_items++;

    if(game_peices[index].pieces==PIECES.GEM) founded_gem++;
    else if(game_peices[index].pieces==PIECES.BOMB)     founded_bomb++;

    if(founded_gem==all_gem){
      win_or_lose = ConstString.winner_text;
      isGameReady = false;
    }else if(founded_bomb==all_bomb ){
      win_or_lose = ConstString.loser_text;
      isGameReady = false;
    }



    notifyListeners();
  }
}