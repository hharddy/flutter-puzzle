import 'package:flutter/material.dart';
import 'package:flutter_puzzle/constant/color/palette.dart';
import '../../util/public_key.dart';


class HumbergerIcon extends StatelessWidget {
  const HumbergerIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15,left: 10),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
          color: Palette.secondary,
          boxShadow: [
            BoxShadow(
                offset: Offset(0,0),
                blurRadius: 6,
                spreadRadius: 8,
                color: Colors.black.withOpacity(0.1)
            ),
            // BoxShadow(
            //     offset: Offset(4,4),
            //     blurRadius: 6,
            //     spreadRadius: 2,
            //     color: Colors.black.withOpacity(0.1)
            // )
          ]
      ),
      child: IconButton(
        onPressed: (){
          key.currentState!.openDrawer();
        },
        icon: Icon(Icons.menu_sharp,color: Colors.white70,),
      ),
    );
  }
}
