import 'dart:math';

import 'package:matrix2d/matrix2d.dart';

String encodeKey(String value, List<int> key1, List<int> key2) {
  List arrayForEncode = value.split('');
  for(int i=arrayForEncode.length; i<28; i++){
    arrayForEncode.add('_');
  }
  arrayForEncode = arrayForEncode.reshape(key1.reduce(max), key2.reduce(max));
//[3,1,2,4], [1,3,7,6,5,4,2]
  List<List<String>> newValue = [
    ['1','3','7','6','5','4','2'], ['1','3','7','6','5','4','2'],
    ['1','3','7','6','5','4','2'], ['1','3','7','6','5','4','2'],
  ];
  int let = 1;
  for (int i = 0; i < key1.toString().length; i++) {
    for (int j = 0; j < key2.toString().length; j++) {
      newValue[key1[i]-1][j] = value[let];
      let++;
    }
  }
  print(newValue.join());
  return newValue.join();
  //return arrayForEncode;
}