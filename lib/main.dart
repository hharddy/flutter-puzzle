import 'package:flutter/material.dart';
import 'package:flutter_puzzle/page/home_page/large_home_page.dart';
import 'package:flutter_puzzle/page/home_page/small_home_page.dart';
import 'package:flutter_puzzle/provider/puzzle_provider.dart';
import 'package:flutter_puzzle/util/puzzle_data.dart';
import 'package:provider/provider.dart';

import 'constant/color/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      body: LayoutBuilder(builder: (context, constraints) {

        if(constraints.maxWidth>700) return LargeHomePage();
        else return SmallHomePage();
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
