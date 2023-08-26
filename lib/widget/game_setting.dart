import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_puzzle/constant/color/palette.dart';
import 'package:flutter_puzzle/constant/number/radius_numbers.dart';
import 'package:flutter_puzzle/widget/number_input.dart';
class GameSetting extends StatelessWidget {


  TextEditingController gems_controller = TextEditingController();
  TextEditingController bombs_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,vertical: 15),
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          
          height: 420,
          width: MediaQuery.of(context).size.width*0.30,
          decoration: BoxDecoration(
            color: Palette.setting_panel,
            borderRadius: BorderRadius.circular(main_radius),
              boxShadow: [
                BoxShadow(
                    offset: Offset(4,4),
                    blurRadius: 7,
                    spreadRadius: 0,
                    color: Palette.secondary.withOpacity(0.1)
                )
              ]
          ),
          child: ListView(
            shrinkWrap: true,
            children: [

              /*
              setting titles
               */
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Manual',style: TextStyle(color: Colors.white,fontSize: 15),),
                    Text('Auto',style: TextStyle(color: Palette.grey_text,fontSize: 15),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: Container(color: Palette.button_blue,height: 3,)),
                    Expanded(child: Container(color: Palette.grey_text,height: 3,)),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              /*
              gem title
               */
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text('Mines',style: TextStyle(color: Palette.grey_text,fontSize: 15),),
              ),
              SizedBox(height: 15,),
              /*
              gem number input section
               */
              Container(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 13),
              margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: Palette.secondary,
                  borderRadius: BorderRadius.circular(10)
                ),
                child:NumberInput(icon_path: '/icon/gem.png',textEditingController: gems_controller),
              ),
              SizedBox(height: 30,),

              /*
              bomb title
               */
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text('Bombs',style: TextStyle(color: Palette.grey_text,fontSize: 15),),
              ),
              SizedBox(height: 15,),
              /*
              bomb number input section
               */
              Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 13),
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                    color: Palette.secondary,
                    borderRadius: BorderRadius.circular(main_radius),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(4,4),
                      blurRadius: 15,
                      spreadRadius: 2,
                      color: Palette.primary.withOpacity(0.8)
                    )
                  ]
                ),
                child:NumberInput(icon_path: '/icon/bomb3.png',textEditingController: bombs_controller),
              ),

              /*
              start button
               */
              SizedBox(height: 40,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Palette.button_blue,
                    padding: EdgeInsets.symmetric(vertical: 20)
                  ),
                  onPressed: () {

              }, child: Text('Start game',style: TextStyle(color: Colors.white),))

            ],
          ),
        ),
        SizedBox(height: 20,),
        Container(height: 70,color: Colors.green,width: 50,),
      ],
    );
  }
}
