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
  26:'z'
};

void main() {
  String input = 'sirotkin';
  String key = 'egorrrrr';

  //print(map.entries);
  //print(input.length);
  //map.find('a');

  var key2 = map.keys.firstWhere((k) => map[k] == 'x', orElse: () => -1);
  print(key2);
  inVigenere (input, key);
}

String inVigenere (String input, String key){
  String output = '';

  for(int i=0; i<input.length; i++){
    if(i == map.keys){
      print(i);
    }
  }

  return output;
}