Map<int, String> map = {
  1:'a',
  2:'b',
  3:'c',
  4:'d',
  5:'e',
  6:'f',
  7:'g',
  8:'h',
  9:'i',
  10:'j',
  11:'k',
  12:'l',
  13:'m',
  14:'n',
  15:'o',
  16:'p',
  17:'q',
  18:'r',
  19:'s',
  20:'t',
  21:'u',
  22:'v',
  23:'w',
  24:'x',
  25:'y',
  26:'z',
  //27:'_'
};

void main() {
  String word = 'sirotkin';
  String key = 'egorrrrr';
  print(map.length);
  String firs = beaufortEncryption(word, key);
  print(firs);
  print(beaufortDecryption(firs, key));
}

String beaufortEncryption(String word, String key){
  List<String> encWord = List.filled(8, '0',growable: false);

  for(int i = 0; i < word.length; i++){
    encWord[i] = map[inBeaufort(word[i], key[i])]!;
  }

  return encWord.join();
}

int inBeaufort (String input, String key){
  int indexInput = map.keys.firstWhere((k) => map[k] == input,
      orElse: () => 999);
  int indexKey = map.keys.firstWhere((k) => map[k] == key,
      orElse: () => 999);
  int newIndex = (indexInput - indexKey) % map.length-1;

  if(newIndex==0){
    return map.length;
  }
  if(newIndex > map.length){
    return newIndex - map.length;
  } else{
    return newIndex;
  }
}

String beaufortDecryption(String word, String key){
  List<String> encWord = List.filled(8, '0',growable: false);

  for(int i = 0; i < word.length; i++){
    encWord[i] = map[outBeaufort(word[i], key[i])]!;
  }

  return encWord.join();
}

int outBeaufort (String input, String key){
  int indexInput = map.keys.firstWhere((k) => map[k] == input,
      orElse: () => 999);
  print(indexInput);
  int indexKey = map.keys.firstWhere((k) => map[k] == key,
      orElse: () => 999);
  //print(indexKey);
  int newIndex = (indexInput + indexKey) % map.length-1;

  //print(newIndex);
  if(newIndex < 0){
    return newIndex + map.length;
  } else{
    return newIndex+2;
  }
}















