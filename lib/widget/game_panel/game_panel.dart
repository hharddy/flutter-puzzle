import 'package:flutter/material.dart';
import 'package:flutter_puzzle/constant/color/palette.dart';
import 'package:flutter_puzzle/constant/number/radius_numbers.dart';
import 'package:flutter_puzzle/entity/game_model.dart';
import 'package:flutter_puzzle/item/game_item.dart';
import 'package:flutter_puzzle/provider/puzzle_provider.dart';
import 'package:flutter_puzzle/util/alert/show_dialog.dart';
import 'package:provider/provider.dart';

import '../../constant/string/const_string.dart';
import '../../util/puzzle_data.dart';
import '../../util/random_numbers.dart';
import '../../util/alert/snack_bar.dart';

class GamePanel extends StatefulWidget {
  const GamePanel({Key? key}) : super(key: key);

  @override
  State<GamePanel> createState() => _GamePanelState();
}

class _GamePanelState extends State<GamePanel> {



  double _height = 450;
  List<int> game_setting =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // game_setting = RandomNumbers.generateUniqueRandomNumbers(4,0,15);

    PuzzleProvider  myNotifier = context.read<PuzzleProvider>(); // Access MyNotifier using Provider

    myNotifier.addListener(() {
      print("Listener");
      if(myNotifier.win_or_lose.isNotEmpty){
      //   DialogHelper.showMyDialog(context,'myNotifier.win_or_lose');
        DialogHelper.showMyDialog(context,myNotifier.win_or_lose);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*
        background image
         */
        Container(
          margin: EdgeInsets.only(right: 20, top: 0),
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
                  image: AssetImage('assets/image/bg1.jpg',)
              )
          ),
        ),

        /*
        game board
         */
        Consumer<PuzzleProvider>(builder: (context, value, child) {

          return Container(
          margin: EdgeInsets.only(right: 20, top: 0),
          height: _height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(main_radius),
            color: Palette.primary.withOpacity(0.7),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 0),
            height: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        child: Image.asset('assets/icon/bomb2.png',fit: BoxFit.fill,),
                      ),
                      SizedBox(height: 10,),
                      Text("${value.founded_bomb}",style: TextStyle(color: Colors.white,fontSize: 15),),
                    ],
                  ),
                ),
                /*
                game panel
                 */
                Expanded(
                  child: Container(
                //    color: Colors.red,
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: ListView.builder(
                        itemCount: (value.game_peices.length + 3) ~/ 4, // Calculate the number of rows needed
                        itemBuilder: (context, rowIndex) {
                          int startingIndex = rowIndex * 4;
                          int endingIndex = startingIndex + 3;
                          endingIndex = endingIndex < value.game_peices.length ? endingIndex : value.game_peices.length - 1;

                          List<Widget> rowItems = [];
                          for (int index = startingIndex; index <= endingIndex; index++) {
                            rowItems.add(


                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                    onTap: () {
                                      if(value.isGameReady==false){
                                        ScaffoldMessenger.of(context).showSnackBar(errorSnackBar(error: ConstString.game_not_ready));

                                      }else {

                                        value.UpdateGame(index);
                                      }


                                    },
                                    child: GameItem(value.game_peices[index],index)),
                              ),

                            );
                          }

                          return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: rowItems);
                        },
                      ),
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
                        child: Image.asset('assets/icon/gem.png',fit: BoxFit.fill,),
                      ),
                      SizedBox(height: 10,),
                      Text("${value.founded_gem}",style: TextStyle(color: Colors.white,fontSize: 15),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        },)
      ],
    );
  }
}
