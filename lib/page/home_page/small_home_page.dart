import 'package:flutter/material.dart';
import 'package:flutter_puzzle/provider/game_panel_provider.dart';
import 'package:flutter_puzzle/widget/game_panel/game_panel.dart';
import 'package:provider/provider.dart';

import '../../util/public_key.dart';
import '../../widget/game_panel/game_panel_small.dart';
import '../../widget/game_setting.dart';
import '../../widget/game_stats.dart';
class SmallHomePage extends StatefulWidget {
  const SmallHomePage({Key? key}) : super(key: key);

  @override
  State<SmallHomePage> createState() => _SmallHomePageState();
}

class _SmallHomePageState extends State<SmallHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GamePanelProvider>(builder: (context, value, child) {
      if(value.ShowGamePanel){
        return GamePanelSmall();
      }else{
        return ListView(
          children: [
            SizedBox(height: 15,),
            GameSetting(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: GameStats(),
            )
          ],
        );
      }
    },);
  }
}
