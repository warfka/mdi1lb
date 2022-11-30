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

  String firs = vigenereEncryption(word, key);
  print(firs);
  print(vigenereDecryption(firs, key));
}

String vigenereEncryption(String word, String key){
  List<String> encWord = List.filled(8, '0',growable: false);

  for(int i = 0; i < word.length; i++){
    encWord[i] = map[inVigenere(word[i], key[i])]!;
  }

  return encWord.join();
}

int inVigenere (String input, String key){
  int indexInput = map.keys.firstWhere((k) => map[k] == input,
      orElse: () => 999);
  int indexKey = map.keys.firstWhere((k) => map[k] == key,
      orElse: () => 999);
  int newIndex = (indexInput + indexKey) % 26-1;

  if(newIndex==0){
    return 26;
  }
  if(newIndex > 26){
    return newIndex - 26;
  } else{
    return newIndex;
  }
}

String vigenereDecryption(String word, String key){
  List<String> encWord = List.filled(8, '0',growable: false);

  for(int i = 0; i < word.length; i++){
    encWord[i] = map[outVigenere(word[i], key[i])]!;
  }

  return encWord.join();
}

int outVigenere (String input, String key){
  int indexInput = map.keys.firstWhere((k) => map[k] == input,
      orElse: () => 999);
  print(indexInput);
  int indexKey = map.keys.firstWhere((k) => map[k] == key,
      orElse: () => 999);
  //print(indexKey);
  int newIndex = (indexInput - indexKey + 26) % 26-1;

  //print(newIndex);
  if(newIndex < 0){
    return newIndex + 26;
  } else{
    return newIndex+2;
  }
}















