import 'package:matrix2d/matrix2d.dart';

String encodeKey(String value, List key1, List key2) {
  int key1Length = key1.toString().length; //запись 3124
  int key2Length = key2.toString().length; //чтение 1376542
  int valueLength = value.length;
  List arrayForEncode = value.split('');
  arrayForEncode = arrayForEncode.reshape(key1Length, key2Length);

  List newValue = [
    [], [], [], [],
  ];
  int let = 0;
  for (int i = 0; i < key1Length; i++) {
    for (int j = 0; j < key2Length; j++) {
      newValue[key1[i]-1][j] = value[let];
      let++;
    }
  }
  return newValue.join();
}