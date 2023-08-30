import 'dart:math';

class RandomNumbers{

static  List<int> generateUniqueRandomNumbers(int count, int min, int max,
      {List<int>? another_list}) {
  print("---- random--");
  if (count > max - min + 1) {
    throw ArgumentError('Cannot generate $count unique numbers in the range $min to $max');
  }

  List<int> result = [];
  Random random = Random();

  while (result.length < count) {
    int randomNumber = random.nextInt(max - min + 1) + min;
    if (!result.contains(randomNumber) && (another_list == null || !another_list.contains(randomNumber))) {
      result.add(randomNumber);
    }
  }

  return result;




}
}