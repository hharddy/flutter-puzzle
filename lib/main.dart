import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_puzzle/page/home_page/large_home_page.dart';
import 'package:flutter_puzzle/page/home_page/small_home_page.dart';
import 'package:flutter_puzzle/provider/puzzle_provider.dart';
import 'package:flutter_puzzle/util/menu_list.dart';
import 'package:flutter_puzzle/util/public_key.dart';
import 'package:flutter_puzzle/util/puzzle_data.dart';
import 'package:flutter_puzzle/util/screen.dart';
import 'package:provider/provider.dart';

import 'constant/color/palette.dart';
import 'entity/main_menu_model.dart';
import 'menu_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
// final  GlobalKey<NavigatorState> dialogKey = GlobalKey<NavigatorState>();

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PuzzleProvider((Puzzle_data.game_peices)),)
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',

        home: const MyHomePage(),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
    return Scaffold(
      key: key,

      backgroundColor: Palette.primary,
     // appBar: AppBar(),
      drawer: Drawer(

        child:  Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width*0.8,
          padding: EdgeInsets.symmetric(horizontal: 7,vertical: 15),
          color: Palette.secondary,
          child: ListView.builder(
            itemCount: menu_list.length,
            itemBuilder: (context, index) {
              return MenuItem(menu: menu_list[index],);
            },
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        DeviceScreen.width = constraints.maxWidth;
        print(constraints.maxWidth.toString());

        if(constraints.maxWidth>885) return LargeHomePage();
        else  return SmallHomePage();
      },),
    );
  }
}



class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("dshjfkdskjdskldsjfkjldsfkljds"),
      ),
    );
  }
}
