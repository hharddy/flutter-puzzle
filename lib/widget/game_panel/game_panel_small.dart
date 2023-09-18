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

class GamePanelSmall extends StatefulWidget {
  const GamePanelSmall({Key? key}) : super(key: key);

  @override
  State<GamePanelSmall> createState() => _GamePanelSmallState();
}

class _GamePanelSmallState extends State<GamePanelSmall> {



  double _height = 550;
  int _index = 0;
  List<int> game_setting =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    PuzzleProvider  myNotifier = context.read<PuzzleProvider>(); // Access MyNotifier using Provider

    myNotifier.addListener(() {
      print("Listener");
      if (myNotifier.win_or_lose.isNotEmpty) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          // Execute your code after the frame is rendered
          DialogHelper.showMyDialog(context, myNotifier.win_or_lose);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            /*
        background image
         */
            Container(
              margin: EdgeInsets.only( top: 0),
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
                padding: EdgeInsets.only( top: 25),
                height: _height,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(main_radius),
                  color: Palette.primary.withOpacity(0.7),
                ),
                child:
/*
                game panel
                 */
                       Container(

                          alignment: Alignment.center,
                          child: Center(
                            child: CustomScrollView(
                              slivers: <Widget>[

                                SliverGrid.count(
                                  crossAxisCount: 4, // Number of columns
                                  crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.2,
                                children:  value.game_peices.map((item) {
                                  return Container(
                                      height: 20,
                                      child: InkWell(
                                          onTap: (){
                                              if(value.isGameReady==false){
                                                ScaffoldMessenger.of(context).showSnackBar(errorSnackBar(error: ConstString.game_not_ready));

                                              }else {
                                                value.UpdateGame(item.id!-1);
                                              }
                                          },
                                          child: GameItem(item,item.id!-1)));
                                }).toList(),
                                )
                              ],
                            ),
                          ),

                          ),




              );
            },)
          ],
        ),

        /*
        game current stats
         */
        Container(
          margin: EdgeInsets.only(top: 20,),
          alignment: Alignment.topCenter,
          child: Consumer<PuzzleProvider>(builder: (context, value, child) {

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            );
          }),
        )
      ],
    );
  }

}
