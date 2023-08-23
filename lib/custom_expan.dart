
import 'package:flutter/material.dart';

import 'entity/main_menu_model.dart';

class CustomExpansionTile extends StatefulWidget {
  final bool initiallyExpanded;
  final Widget title;
  final List<Widget> children;
  MainMenu? menu;

  CustomExpansionTile({
    Key? key,
    this.initiallyExpanded = false,
    required this.title,
    required this.children,
    this.menu,
  }) : super(key: key);

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  void expand() {
    print("expand");
    setState(() {
      _isExpanded = true;
    });
  }

  void collapse() {
    print("colapples");
    setState(() {
      _isExpanded = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,

      children: [
        Container(
          // onTap: () {
          // },
          margin: EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: Color(0xff22284d),
            borderRadius: BorderRadius.circular(6)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 2,),
              Expanded(child: widget.title),
              IconButton(
                  padding: EdgeInsets.all(0),
                  color: Colors.white,
                  onPressed: (){
                    // print("icon clicked");
                    if (_isExpanded) {
                      collapse();

                    } else {
                      expand();
                    }
                  }, icon: Icon(
                _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              )),
            ],
          ),
        ),
        if (_isExpanded)
          InkWell(
            onTap: (){
            },
            child: Container(
              //width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 10,top: 5,left: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: widget.children,
              ),
            ),
          ),
      ],
    );
  }
}