import 'dart:math';

String encodeKey(String value, List<int> key1, List<int> key2) {
  value = value.replaceAll(' ', '_');
  for(int i=value.length; i<28; i++){
    value += '_';
  }
//[3,1,2,4], [1,3,7,6,5,4,2]
  List<List<String>> newValue = [
    ['1','3','7','6','5','4','2'],
    ['1','3','7','6','5','4','2'],
    ['1','3','7','6','5','4','2'],
    ['1','3','7','6','5','4','2'],
  ];
  int stringIndex = 0;

  for(int row = 0; row < key1.reduce(max); row++) {
    for(int column = 0; column < key2.reduce(max); column++) {
      newValue[key1[row]-1][column] = value[stringIndex];
      stringIndex++;
    }
  }

  return newValue.join();
  //return arrayForEncode;
}

String deEncodeKey(String value, List<int> key1, List<int> key2) {
  value = value.replaceAll(' ', '_');
  for(int i=value.length; i<28; i++){
    value += '_';
  }
//[3,1,2,4], [1,3,7,6,5,4,2]
  List<List<String>> newValue = [
    ['1','3','7','6','5','4','2'],
    ['1','3','7','6','5','4','2'],
    ['1','3','7','6','5','4','2'],
    ['1','3','7','6','5','4','2'],
  ];
  int stringIndex = 0;

  for(int row = 0; row < key1.reduce(max); row++) {
    for(int column = 0; column < key2.reduce(max); column++) {
      newValue[key1[row]-1][column] = value[stringIndex];
      stringIndex++;
    }
  }

  return newValue.join();
  //return arrayForEncode;
}