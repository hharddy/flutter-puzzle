import 'package:flutter/material.dart';
import 'package:flutter_puzzle/constant/color/palette.dart';
import 'package:flutter_puzzle/constant/number/radius_numbers.dart';
import 'package:flutter_puzzle/entity/game_model.dart';
import 'package:flutter_puzzle/item/game_item.dart';

import '../util/puzzle_data.dart';

class GamePanel extends StatefulWidget {
  const GamePanel({Key? key}) : super(key: key);

  @override
  State<GamePanel> createState() => _GamePanelState();
}

class _GamePanelState extends State<GamePanel> {



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
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /*
                bomb count
                 */
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        child: Image.asset('/icon/bomb2.png',fit: BoxFit.fill,),
                      ),
                      SizedBox(height: 10,),
                      Text("2",style: TextStyle(color: Colors.white,fontSize: 15),),
                    ],
                  ),
                ),
                /*
                game panel
                 */
                Expanded(
                  child: Container(
                  //  height: 400,
                   // width: 200,
             //       color: Colors.red,
                    child: ListView.builder(
                      itemCount: (Puzzle_data.game_peices.length + 3) ~/ 4, // Calculate the number of rows needed
                      itemBuilder: (context, rowIndex) {
                        int startingIndex = rowIndex * 4;
                        int endingIndex = startingIndex + 3;
                        endingIndex = endingIndex < Puzzle_data.game_peices.length ? endingIndex : Puzzle_data.game_peices.length - 1;

                        List<Widget> rowItems = [];
                        for (int index = startingIndex; index <= endingIndex; index++) {
                          rowItems.add(

                            //    padding: EdgeInsets.all(8.0), // Add padding between items
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GameItem(Puzzle_data.game_peices[index]),
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

                /*
                Gem count
                 */
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        child: Image.asset('/icon/gem.png',fit: BoxFit.fill,),
                      ),
                      SizedBox(height: 10,),
                      Text("2",style: TextStyle(color: Colors.white,fontSize: 15),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
