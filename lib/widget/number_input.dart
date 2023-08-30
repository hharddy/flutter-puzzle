import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_puzzle/constant/number/radius_numbers.dart';

import '../constant/color/palette.dart';

class NumberInput extends StatelessWidget {
  TextEditingController? textEditingController;
  String? icon_path;
  bool? is_bomb;


  NumberInput({this.textEditingController, this.icon_path,this.is_bomb});

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
          Container(

            child: Image.asset(icon_path!,
              width: is_bomb==true?25:22,
              height: is_bomb==true?25:22,
              fit: BoxFit.fill,),
          ),
          SizedBox(width: 10,),
          Expanded(
              child: TextField(
            controller: textEditingController,
            style: TextStyle(color: Colors.white,fontSize: 17),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration:const  InputDecoration(
              hintStyle: TextStyle(color: Colors.white,fontSize: 14),
              hintText: "Enter number",
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          )),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 10),

            child: Text("Transfer",style: TextStyle(fontSize: 12,color: Palette.grey_text),),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(second_radius),
                color: Palette.setting_panel,
                boxShadow: [
                  BoxShadow(
                    color: Palette.primary.withOpacity(0.8),
                    offset: Offset(8,8),
                    blurRadius:16.0,
                    // spreadRadius: 1
                  ),
                  BoxShadow(
                    color: Color(0xff232951),
                    //color: Palette.primary,
                    offset: Offset(-8,-8),
                    blurRadius:16.0,
                    //spreadRadius: 1
                  )
                ]
            ),
          )
        ],

    );
  }
}
