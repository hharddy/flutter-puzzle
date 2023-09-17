import 'package:flutter/material.dart';
import 'package:flutter_puzzle/entity/main_menu_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'util/custom_expan.dart';

class MenuItem extends StatelessWidget {
  MainMenu? menu;
  String? empty = "";
  int? is_click_icon = 0;

  MenuItem({this.menu});


  List<Widget> SubMenu(){
    List<Widget> sub_menu = [];

    menu!.subMenu!.forEach((element) {
      sub_menu.add(
          Container(
          margin: EdgeInsets.symmetric(vertical: 7),
          child:  Row(
            children: [

              Container(height: 25,width: 25,

                child: SvgPicture.asset(
                    element.icon!,
                    semanticsLabel: 'A red up arrow'
                ),),
              SizedBox(width: 6,),
              Text(element.title!,style: TextStyle(fontSize: 15,color: Colors.white)),
            ],
          )
      ));
    });
    return sub_menu;
  }

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      initiallyExpanded: false,
      menu: menu,

      children: SubMenu(),
      title:  Container(

        child: InkWell(
          onTap: () {

          },
          child:
          Row(
            children: [

              Container(height: 25,width: 25,

                child: SvgPicture.asset(
                    menu!.icon!,
                    semanticsLabel: 'A red up arrow'
                ),),
              SizedBox(width: 6,),
              Text(menu!.title!,style: TextStyle(fontSize: 15,color: Colors.white)),
            ],
          ),
        )

      ),




    );
  }
}
