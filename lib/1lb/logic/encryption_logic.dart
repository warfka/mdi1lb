import 'dart:math';

List<List<String>> encodeKey(String value, List<int> key1, List<int> key2) {
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
  return newValue;
}
String eListToString(List<List<String>> newValue){
  List<String> outString = [];
  for(int row = 0; row < 4; row++) {
    for(int column = 0; column < 7; column++) {
      outString.add(newValue[row][column]);
    }
  }
  return outString.join();
}

List<String> deEncodeKey(List<List<String>> valueL, List<int> key1, List<int> key2) {

  List<String> outText = ['1','3','7','6','5','4','2','1','3','7','6','5','4','2','1','3','7','6','5','4','2','1','3','7','6','5','4','2'];

  int stringIndex = 0;

  //var outText = List<String>.empty(growable: true)..length = 28;
  for(int row = 0; row < key1.reduce(max); row++) {
    for(int column = 0; column < key2.reduce(max); column++) {
      outText[stringIndex] = valueL[key1[row]-1][column];
      stringIndex++;
    }
  }

  return outText;
}