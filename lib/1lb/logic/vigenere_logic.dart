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
  27:'_'
};

void main() {
  String word = 'sirotkin';
  String key = 'egorrrrr';

  //String s1 = 'f';
  //String s2 = 'r';

  //print(inVigenere (s1, s2));
  //print(outVigenere (s1, s2));

  vigenereEncryption(word, key);
}

String vigenereEncryption(String word, String key){
  String encWord = '';

  for(int i = 0; i < word.length; i++){
    encWord = map.values.firstWhere((k) =>
    map[k] == inVigenere(word[i], key[i]), orElse: () => 'error');
  }
  print(encWord);
  return encWord;
}

int inVigenere (String input, String key){
  int indexInput = map.keys.firstWhere((k) => map[k] == input,
      orElse: () => 999);
  int indexKey = map.keys.firstWhere((k) => map[k] == key,
      orElse: () => 999);
  int newIndex = (indexInput + indexKey) % 27;
  if(newIndex==0){
    return 27;
  }
  if(newIndex > 27){
    return newIndex - 27;
  } else{
    return newIndex;
  }
}



int outVigenere (String input, String key){
  int indexInput = map.keys.firstWhere((k) => map[k] == input, orElse: () => -1);
  int indexKey = map.keys.firstWhere((k) => map[k] == key, orElse: () => -1);
  int newIndex = indexInput - indexKey % 27;

  if(newIndex < 0){
    return newIndex + 27;
  } else{
    return newIndex;
  }
}















