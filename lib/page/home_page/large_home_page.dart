import 'package:flutter/material.dart';
import 'package:flutter_puzzle/widget/game_panel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constant/color/palette.dart';
import '../../entity/main_menu_model.dart';
import '../../menu_item.dart';
import '../../util/hamburger_icon.dart';
import '../../util/menu_list.dart';
import '../../util/screen.dart';
import '../../widget/game_setting.dart';
import '../../widget/game_stats.dart';
class LargeHomePage extends StatefulWidget {
  const LargeHomePage({Key? key}) : super(key: key);

  @override
  State<LargeHomePage> createState() => _LargeHomePageState();
}

class _LargeHomePageState extends State<LargeHomePage> {

  List<String> mlist = ['ssds','ssdgfgg'];

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            child: DeviceScreen.width<1093? HumbergerIcon()
                :
            Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width*0.15,
              padding: EdgeInsets.symmetric(horizontal: 7,vertical: 15),
              color: Palette.secondary,
              child: ListView.builder(
                itemCount: menu_list.length,
                itemBuilder: (context, index) {
                  return MenuItem(menu: menu_list[index],);
                },
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                GameSetting(),
                Container(
                  color: Colors.red,

                    width:DeviceScreen.width<1093?MediaQuery.of(context).size.width*0.52:MediaQuery.of(context).size.width*0.42,
                    alignment: Alignment.center,
                    child: GamePanel()
                )
              ],),

              GameStats()

            ],
          )

        ],
      ),
    );
  }
}


