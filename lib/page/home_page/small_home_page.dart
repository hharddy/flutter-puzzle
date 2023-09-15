import 'package:flutter/material.dart';

import '../../util/public_key.dart';
class SmallHomePage extends StatefulWidget {
  const SmallHomePage({Key? key}) : super(key: key);

  @override
  State<SmallHomePage> createState() => _SmallHomePageState();
}

class _SmallHomePageState extends State<SmallHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: InkWell(

      onTap: (){
        key.currentState!.openDrawer(); //<-- SEE HERE

      },
      child: Text("Open"),
    ),
    );
  }
}
