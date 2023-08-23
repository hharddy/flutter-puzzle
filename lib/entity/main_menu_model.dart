class MainMenu{

  String? title;
  String? icon;
  List<MainMenu>? subMenu = [];

  MainMenu({this.title, this.icon, this.subMenu});

  MainMenu.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    if (json['subMenu'] != null) {
      subMenu!.clear();
      json['subMenu'].forEach((v) {
        subMenu?.add( MainMenu.fromJson(v));
      });
    }
  }
}