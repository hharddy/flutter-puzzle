import 'dart:math';

void main() {
  List<int> another = [0,1,2,3,4,5,6,7,8,9];
  List<int> uniqueRandomNumbers = generateUniqueRandomNumbers(4, 0, 15,another_list: another);
  print(uniqueRandomNumbers);
}

List<int> generateUniqueRandomNumbers(int count, int min, int max,
    {List<int>? another_list}) {
  if (count > max - min + 1) {
    throw ArgumentError('Cannot generate $count unique numbers in the range $min to $max');
  }

  List<int> result = [];
  Random random = Random();

  while (result.length < count) {
    int randomNumber = random.nextInt(max - min + 1) + min;
    if (!result.contains(randomNumber)) {
      if(another_list !=null &&  !another_list.contains(randomNumber)){

          print("not contain");
          result.add(randomNumber);


      }

    }else{
      result.add(randomNumber);
      print(" null");
    }
  }

  return result;
}





