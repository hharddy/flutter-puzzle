import 'package:flutter/material.dart';
import 'package:flutter_puzzle/constant/color/palette.dart';
import 'package:flutter_puzzle/constant/number/radius_numbers.dart';
import 'package:flutter_puzzle/entity/game_model.dart';
import 'package:flutter_puzzle/item/game_item.dart';

class GamePanel extends StatefulWidget {
  const GamePanel({Key? key}) : super(key: key);

  @override
  State<GamePanel> createState() => _GamePanelState();
}

class _GamePanelState extends State<GamePanel> {


  List<GameModel> game_peices = [

    GameModel(id: 1,choosed: false),
    GameModel(id: 2,choosed: false),
    GameModel(id: 3,choosed: false),
    GameModel(id: 4,choosed: false),
    GameModel(id: 5,choosed: false),
    GameModel(id: 6,choosed: false),
    GameModel(id: 7,choosed: false),
    GameModel(id: 8,choosed: false),
    GameModel(id: 9,choosed: false),
    GameModel(id: 10,choosed: false),
    GameModel(id: 11,choosed: false),
    GameModel(id: 12,choosed: false),
    GameModel(id: 13,choosed: false),
    GameModel(id: 14,choosed: false),
    GameModel(id: 15,choosed: false),
    GameModel(id: 16,choosed: false),
    GameModel(id: 17,choosed: false),
    GameModel(id: 18,choosed: false),
    GameModel(id: 19,choosed: false),
    GameModel(id: 20,choosed: false),
    GameModel(id: 21,choosed: false),
    GameModel(id: 22,choosed: false),
    GameModel(id: 23,choosed: false),
    GameModel(id: 24,choosed: false),
  ];
  double _height = 450;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20, top: 15),
          height: _height,
          width: MediaQuery.of(context).size.width,
          // color: Colors.green,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(main_radius),
              boxShadow:  [
              BoxShadow(
              offset: Offset(4,4),
            blurRadius: 7,
            spreadRadius: 0,
            color: Palette.secondary.withOpacity(0.1)
        )
      ],
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('/image/bg1.jpg',)
              )
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 20, top: 15),
          height: _height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(main_radius),
            color: Palette.primary.withOpacity(0.7),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
            height: 400,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      child: Image.asset('/icon/bomb2.png',fit: BoxFit.fill,),
                    ),
                    Text("Bomb",style: TextStyle(color: Colors.white),),
                  ],
                ),
                Expanded(
                  child: Container(
                  //  height: 400,
                   // width: 200,
                    color: Colors.red,
                    child: ListView.builder(
                      itemCount: (game_peices.length + 3) ~/ 4, // Calculate the number of rows needed
                      itemBuilder: (context, rowIndex) {
                        int startingIndex = rowIndex * 4;
                        int endingIndex = startingIndex + 3;
                        endingIndex = endingIndex < game_peices.length ? endingIndex : game_peices.length - 1;

                        List<Widget> rowItems = [];
                        for (int index = startingIndex; index <= endingIndex; index++) {
                          rowItems.add(

                            //    padding: EdgeInsets.all(8.0), // Add padding between items
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GameItem(game_peices[index]),
                            ),

                          );
                        }

                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: rowItems);
                      },
                    ),
                  ),
                ),
                Text("dddddddddddd",style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        )
      ],
    );
  }
}
