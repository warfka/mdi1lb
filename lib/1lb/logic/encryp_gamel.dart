import 'dart:math';

List<List<String>> gamel(String value, List<int> key1) {
  value = value.replaceAll(' ', '_');
  for(int i=value.length; i<28; i++){
    value += '_';
  }
//[1,3,2,7,6,4,5]
  List<List<String>> newValue = [
    ['1','3','2','7','6','4','5'],
    ['1','3','2','7','6','4','5'],
    ['1','3','2','7','6','4','5'],
    ['1','3','2','7','6','4','5'],
  ];
  int stringIndex = 0;

  key1 = [1,3,2,6,7,5,4];
  for(int row = 0; row < 4; row++) {
    for(int column = 0; column < 7; column++) {
      newValue[row][key1[column]-1] = value[stringIndex];
      stringIndex++;
    }
  }

    return newValue;
}

String gListToString(List<List<String>> newValue){
  List<String> outString = [];
  for(int row = 0; row < 4; row++) {
    for(int column = 0; column < 7; column++) {
      outString.add(newValue[row][column]);
    }
  }
  return outString.join();
}

String deGamel(String valueOld, List<int> key1) {

//[1,3,2,7,6,4,5]
  List<List<String>> value = [
    ['1','3','2','7','6','4','5'],
    ['1','3','2','7','6','4','5'],
    ['1','3','2','7','6','4','5'],
    ['1','3','2','7','6','4','5'],
  ];
  int stringIndex = 0;
  for(int row = 0; row < 4; row++) {
    for(int column = 0; column < 7; column++) {
      value[row][column] = valueOld[stringIndex];
      stringIndex++;
    }
  }
  stringIndex = 0;
  List<String> outText1 = ['1','3','7','6','5','4','2','1','3','7','6','5','4','2','1',
    '3','7','6','5','4','2','1','3','7','6','5','4','2'];
  for(int row = 0; row < 4; row++) {
    for(int column = 0; column < 7; column++) {
      outText1[stringIndex] = value[row][key1[column]-1];
      stringIndex++;
    }
  }

  return outText1.join();
}