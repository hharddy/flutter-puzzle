import 'dart:math';

void main() {
  List<int> uniqueRandomNumbers = generateUniqueRandomNumbers(4, 0, 15);
  print(uniqueRandomNumbers);
}

List<int> generateUniqueRandomNumbers(int count, int min, int max) {
  if (count > max - min + 1) {
    throw ArgumentError('Cannot generate $count unique numbers in the range $min to $max');
  }

  List<int> result = [];
  Random random = Random();

  while (result.length < count) {
    int randomNumber = random.nextInt(max - min + 1) + min;
    if (!result.contains(randomNumber)) {
      result.add(randomNumber);
    }
  }

  return result;
}





