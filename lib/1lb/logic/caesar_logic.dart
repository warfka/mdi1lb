import 'dart:io';

List<String> alphabet = [
  'а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р',
  'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я'
];

String caesar(var plaintext) {
  var k = 2;
  stdout.write("Enter the plaintext: ");
  var plaintext = (stdin.readLineSync() ?? "").toLowerCase();
  var ciphertext = "";
  for (var char in plaintext.split('')) {
    if (char.contains(RegExp(r'[а-я]'))) {
      for (var i = 0; i < 33; i++) {
        if (alphabet[i] == char) {
          if (i < 33 - k) {
            ciphertext += alphabet[i + k];
          } else {
            ciphertext += alphabet[i + k - 33];
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
//https://stackoverflow.com/questions/68069234/accomodate-more-characters-in-dart-caesar-cipher