import 'package:flutter/material.dart';
import 'package:flutter_puzzle/expan_custom.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constant/palette.dart';
import '../../entity/main_menu_model.dart';
class LargeHomePage extends StatefulWidget {
  const LargeHomePage({Key? key}) : super(key: key);

  @override
  State<LargeHomePage> createState() => _LargeHomePageState();
}

class _LargeHomePageState extends State<LargeHomePage> {

  List<String> mlist = ['ssds','ssdgfgg'];
  List dataList = [
  {
  "title": "Available ",
  "icon": '/icon/dice.svg',
  "subMenu": [
    {"title": "Puzzle",
      "icon": '/icon/puzzle.svg'},

  ]
},
    {
      "title": "Soon ",
      "icon": '/icon/atari.svg',
      "subMenu": [
        {"title": "Baccarat",
          "icon": '/icon/card.svg'},

        {"title": "Blackjack",
          "icon": '/icon/among.svg'},

        {"title": "Craps",
          "icon": '/icon/compass.svg'},

        {"title": "Playstation",
          "icon": '/icon/controller.svg'},

        {"title": "Dart",
          "icon": '/icon/dart.svg'}
      ]
    },
    {
      "title": "Premium ",
      "icon": '/icon/dommino.svg',
      "subMenu": [
        {"title": "Cubes",
          "icon": '/icon/rocket.svg'},

        {"title": "Shield",
          "icon": '/icon/sword.svg'},

      ]
    },
    ];
  List<MainMenu> menu_list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataList.forEach((element) {
      menu_list.add(MainMenu.fromJson(element));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // Container(width: 100,height: 50,
          //
          // child: SvgPicture.asset(
          //     '/icon/controller.svg',
          //     semanticsLabel: 'A red up arrow'
          // ),),
          Container(
            height: double.infinity,
            //height: 200,
            width: MediaQuery.of(context).size.width*0.2,
            padding: EdgeInsets.symmetric(horizontal: 7,vertical: 15),
            color: Palette.secondary,
            child: ListView.builder(
              itemCount: menu_list.length,
              itemBuilder: (context, index) {
                return ItemMenu2(menu: menu_list[index],);
              },
            ),
          ),

        ],
      ),
    );
  }
}
