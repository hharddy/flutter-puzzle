import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_puzzle/constant/color/palette.dart';
class TxtStyle{

  static var winner_style = TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.w600);
  static var loser_style = TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.w600);

  static var game_finish_desc = TextStyle(fontSize: 15);

  static var user_stat_item = TextStyle(fontSize: 13,color: Palette.grey_text);
  static var stat_title = TextStyle(fontSize: 13,color: Colors.black);
}