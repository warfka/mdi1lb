import 'package:matrix2d/matrix2d.dart';

String encodeOneKey(String value, int key1, int key2) {
  String newValue = '';
  int key1Length = key1.toString().length; //запись
  int key2Length = key2.toString().length; //чтение
  int valueLength = value.length;
  List arrayForEncode = value.split('');
  arrayForEncode = arrayForEncode.reshape(key1Length, key2Length);

  for (int i = 0; i < valueLength % key.Length; i++){
    input += input[i];
  }

  return newValue;
}

