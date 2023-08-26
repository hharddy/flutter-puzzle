class GameModel{
  int? id;
  PIECES? pieces;
  bool? choosed;

  GameModel({this.id,  this.choosed,this.pieces}){
    if(this.pieces==null){
      this.pieces = PIECES.INIT;
    }
  }

}

enum PIECES  {GEM,BOMB,NOTHING,INIT}