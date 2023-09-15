// import 'dart:math';
//
void main() async{

  print("Start");
//  var temp =await TestDelay('Async operation');
  //var temp2 = TestNoram('Normal operation');

   TestDelay('Async operation');
  print(TestNoram('Normal operation'));
  print("Finish");

}




String TestNoram(var data){
  return data;
}

Future<void> TestDelay(var data) async{
  Future.delayed(Duration(seconds: 2,),() {
    return print(data);
  },);
  //return data;
}



