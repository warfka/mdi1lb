
List<String> alphabet = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z'
];

String caesar(var plaintext) {

  var k = 3;//int.parse(stdin.readLineSync() ?? "0");
  //stdout.write("Enter the plaintext: ");
  // not including the uppercase
  //var plaintext = 'sirotkin_egor_aleksandrovic';//(stdin.readLineSync() ?? "").toLowerCase();
  var ciphertext = "";
  for (var char in plaintext.split('')) {
    // if the char is a letter, then match the alphabet
    if (char.contains(RegExp(r'[a-z]'))) {
      for (var i = 0; i < 26; i++) {
        if (alphabet[i] == char) {
          // if the matched letter is 26-k below, then find the letter over k interval
          if (i < 26 - k) {
            ciphertext += alphabet[i + k];
          } else {
            // if above, return the start point
            ciphertext += alphabet[i + k - 26];
          }
        }
      }
    } else {
      // if not, then simply add it
      ciphertext += char;
    }
  }
  print("The ciphertext is: $ciphertext");
  return ciphertext;
}
String deCaesar(String plaintext) {

  var k = 26;//int.parse(stdin.readLineSync() ?? "0");
  //stdout.write("Enter the plaintext: ");
  // not including the uppercase
  plaintext = 'sirotkin_egor_aleksandrovich';//(stdin.readLineSync() ?? "").toLowerCase();
  var ciphertext = "";
  for (var char in plaintext.split('')) {
    // if the char is a letter, then match the alphabet
    if (char.contains(RegExp(r'[a-z]'))) {
      for (var i = 0; i < 26; i++) {
        if (alphabet[i] == char) {
          // if the matched letter is 26-k below, then find the letter over k interval
          if (i < 26 - k) {
            ciphertext += alphabet[i + k];
          } else {
            // if above, return the start point
            ciphertext += alphabet[i + k - 26];
          }
        }
      }
    } else {
      // if not, then simply add it
      ciphertext += char;
    }
  }
  print("The ciphertext is: $ciphertext");
  return ciphertext;
}