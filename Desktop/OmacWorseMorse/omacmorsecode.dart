import 'dart:io';
import 'dart:core';

var morse_code = [
  ".-",
  "-...",
  "-.-.",
  "-..",
  ".",
  "..-.",
  "--.",
  "....",
  "..",
  ".---",
  "-.-",
  ".-..",
  "--",
  "-.",
  "---",
  ".--.",
  "--.-",
  ".-.",
  "...",
  "-",
  "..-",
  "...-",
  ".--",
  "-..-",
  "-.--",
  "--.."
];
var letters = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z"
];
dart
void main() {
  var str = stdin.readLineSync();
  decodemorse(str, "");
}

bool is_valid(var str) {
  for (var i = 0; i < 26; i++) if (str == morse_code[i]) return true;
  return false;
}

void decodemorse(var to_DC, var just_DC) {
  if (to_DC.length == 0)
    print(just_DC);
  else {
    for (int i = 0; i < 26; i++) {
      if (to_DC.startsWith(morse_code[i])) {
        var currentD_code = just_DC + letters[i];
        var currentTD_code = to_DC.substring(morse_code[i].length);
        decodemorse(currentTD_code, currentD_code);
      }
    }
  }
}
