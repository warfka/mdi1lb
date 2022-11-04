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
  List<String> outText1 = ['1','3','7','6','5','4','2','1','3','7','6','5','4','2','1',
    '3','7','6','5','4','2','1','3','7','6','5','4','2'];
  for(int row = 0; row < key1.reduce(max); row++) {
    for(int column = 0; column < key2.reduce(max); column++) {
      newValue[key1[row]-1][column] = value[stringIndex];
      stringIndex++;
    }
  }

  stringIndex = 0;
  for(int column = 0; column < 7; column++) {
    for(int row = 0; row < 4; row++) {
      outText1[stringIndex] = newValue[row][key2[column]-1];
      stringIndex++;
    }
  }
  return outText1.join();
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

String deEncodeKey(String valueL, List<int> key1, List<int> key2) {

  int stringIndex = 0;
  List<List<String>> newValue = [
    ['1','3','7','6','5','4','2'],
    ['1','3','7','6','5','4','2'],
    ['1','3','7','6','5','4','2'],
    ['1','3','7','6','5','4','2'],
  ];
  List<List<String>> newValueL = [
    ['1','3','7','6','5','4','2'],
    ['1','3','7','6','5','4','2'],
    ['1','3','7','6','5','4','2'],
    ['1','3','7','6','5','4','2'],
  ];
  for(int column = 0; column < 7; column++) {
    for(int row = 0; row < 4; row++) {
      newValue[row][key2[column]-1] = valueL[stringIndex];
      stringIndex++;
    }
  }

  for(int row = 0; row < 4; row++) {
    for(int column = 0; column < 7; column++) {
      newValueL[row][column] = newValue[key1[row]-1][column];
      stringIndex++;
    }
  }


  List<String> outString = [];

  for(int row = 0; row < 4; row++) {
    for(int column = 0; column < 7; column++) {
      outString.add(newValue[row][column]);
    }
  }
  //return outString.join();
  return eListToString(newValueL);
  //return newValueL.join();
}