import 'package:flutter/material.dart';

import '../../constant/string/const_string.dart';
import '../../constant/style/txt_style.dart';

class DialogHelper {

  static void showMyDialog(BuildContext? context,String message) {
   // BuildContext? context = dialogKey.currentContext;
    if (context != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message,
            style: message==ConstString.winner_text?TxtStyle.winner_style:TxtStyle.loser_style,
            ),

            content: Text(ConstString.finished_game_desc,
            style: TxtStyle.game_finish_desc,),
            actions: <Widget>[
             ElevatedButton(onPressed: (){
               Navigator.pop(context);
             },
                 child: Text('Ok'))
            ],
          );
        },
      );
    }
  }
}