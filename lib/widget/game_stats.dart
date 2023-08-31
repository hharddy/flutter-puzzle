import 'package:flutter/material.dart';
import 'package:flutter_puzzle/item/stat_item.dart';

import '../constant/style/txt_style.dart';
import '../entity/stat_model.dart';

class GameStats extends StatelessWidget {

  List<StatModel> stat_list = [];
  GameStats(){
    stat_list.add(StatModel(game: 'Puzzle',multiplier: 'X3.4',score: '32812',user: 'Hesam'));
    stat_list.add(StatModel(game: 'Puzzle',multiplier: 'X3.4',score: '3212',user: 'Ali'));
    stat_list.add(StatModel(game: 'Puzzle',multiplier: 'X3.4',score: '32512',user: 'Elham'));
    stat_list.add(StatModel(game: 'Puzzle',multiplier: 'X3.4',score: '3212',user: 'Hesam'));
    stat_list.add(StatModel(game: 'Puzzle',multiplier: 'X3.4',score: '3212',user: 'Ali'));
    stat_list.add(StatModel(game: 'Puzzle',multiplier: 'X3.4',score: '3212',user: 'Elham'));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.8,
    margin: EdgeInsets.only(top: 30),
    padding: EdgeInsets.only(left: 30),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15,top: 4),
                  margin: EdgeInsets.symmetric(horizontal: 0,vertical: 4),
                  child: Text('User',style: TxtStyle.stat_title,),),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0,vertical: 4),
                  margin: EdgeInsets.symmetric(horizontal: 0,vertical: 4),
                  child: Text('Game',style: TxtStyle.stat_title),),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0,vertical: 4),
                  margin: EdgeInsets.symmetric(horizontal: 0,vertical: 4),
                  child: Text('Score',style: TxtStyle.stat_title),),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0,vertical: 4),
                  margin: EdgeInsets.symmetric(horizontal: 0,vertical: 4),
                  child: Text('Multiplier',style: TxtStyle.stat_title),),
              ),

            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.2,
              child: ListView.builder(
            itemCount: stat_list.length,
            itemBuilder: (context, index) {
              return StatItem(stat_list[index]);
            },
          ))
        ],
      ),
    );
  }
}
