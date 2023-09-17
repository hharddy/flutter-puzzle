import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class GamePanelProvider extends ChangeNotifier{

  bool ShowGamePanel = true;

  void ChangeGamePanel(){
    if (ShowGamePanel) ShowGamePanel=false;
    else ShowGamePanel = true;
    notifyListeners();
  }
}