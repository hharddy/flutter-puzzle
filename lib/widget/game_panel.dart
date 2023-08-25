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
    GameModel(id: 1,choosed: false),
    GameModel(id: 1,choosed: false),
    GameModel(id: 1,choosed: false),
    GameModel(id: 1,choosed: false),
    GameModel(id: 1,choosed: false),
    GameModel(id: 1,choosed: false),
    GameModel(id: 1,choosed: false),
    GameModel(id: 1,choosed: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.03,top: 15),
          height: 420,
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
          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03, top: 15),
          height: 420,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(main_radius),
            color: Palette.primary.withOpacity(0.7),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 35,vertical: 10),
            child: GridView.builder(

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                 crossAxisSpacing: 20,
               //  mainAxisExtent: 60,
                childAspectRatio: 1.4
                // Number of columns in the grid
              ),
              itemCount: game_peices.length,
              itemBuilder: (context, index) {

                return Container(
                  margin: EdgeInsets.only(top: 4),

                 color: Colors.green,
                  child: GameItem(game_peices[index]),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
