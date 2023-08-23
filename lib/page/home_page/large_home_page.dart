import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constant/palette.dart';
import '../../entity/main_menu_model.dart';
import '../../menu_item.dart';
import '../../util/menu_list.dart';
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
                return MenuItem(menu: menu_list[index],);
              },
            ),
          ),

        ],
      ),
    );
  }
}
