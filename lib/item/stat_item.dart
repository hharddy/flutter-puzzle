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
      padding: EdgeInsets.only(left: 10,top: 7,bottom: 7),
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(main_radius),
        color: Palette.secondary
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Expanded(child: Text(statModel.game!,style: TxtStyle.user_stat_item)),
         Expanded(child: Text(statModel.user!,style: TxtStyle.user_stat_item)),
         Expanded(child: Text(statModel.score!,style: TxtStyle.user_stat_item)),
         Expanded(child: Text(statModel.multiplier!,style: TxtStyle.user_stat_item)),
       ],
      ),
    );
  }
}
