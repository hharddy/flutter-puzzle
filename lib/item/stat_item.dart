import 'package:flutter/material.dart';
import 'package:flutter_puzzle/constant/color/palette.dart';
import 'package:flutter_puzzle/constant/number/radius_numbers.dart';
import 'package:flutter_puzzle/entity/stat_model.dart';

import '../constant/style/txt_style.dart';

class StatItem extends StatelessWidget {
 StatModel statModel;


 StatItem(this.statModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 9),
      margin: EdgeInsets.symmetric(horizontal: 0,vertical: 4,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(main_radius),
        color: Palette.secondary,
          boxShadow: [
            BoxShadow(
                offset: Offset(2,2),
                blurRadius: 3,
                spreadRadius: 0,
                color: Palette.secondary.withOpacity(0.4)
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Expanded(
             child: Container(
                 padding: EdgeInsets.only(left: 15,),
                 child: Row(
                   children: [
                     Container(
                       margin: EdgeInsets.only(right: 5),
                       width: 27,
                       height: 27,
                       child: Image.asset('/icon/person.png',fit: BoxFit.cover,),
                     ),
                     Text(statModel.game!,style: TxtStyle.user_stat_item,),

                   ],
                 )
             )
         ),

         Expanded(child: Text(statModel.user!,style: TxtStyle.user_stat_item)),
         Expanded(child: Text(statModel.score!,style: TxtStyle.user_stat_item)),
         Expanded(child: Text(statModel.multiplier!,style: TxtStyle.user_stat_item)),
       ],
      ),
    );
  }
}
