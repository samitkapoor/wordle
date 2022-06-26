import 'package:wordle/models/alphabet.dart';

class Keyboard {
  void reset() {
    disabledAlphabets = [];
    correctAlphabets = [];
    notInPlaceAlphabets = [];
  }

  //All the disabled alphabets will be stored inside this list
  List<String> disabledAlphabets = [];

  List<String> correctAlphabets = [];

  List<String> notInPlaceAlphabets = [];

  //List containing all the alphabets in the top row of the keyboard
  List<Alphabet> rowOne = [
    Alphabet(value: 'q'),
    Alphabet(value: 'w'),
    Alphabet(value: 'e'),
    Alphabet(value: 'r'),
    Alphabet(value: 't'),
    Alphabet(value: 'y'),
    Alphabet(value: 'u'),
    Alphabet(value: 'i'),
    Alphabet(value: 'o'),
    Alphabet(value: 'p'),
  ];

  //List containing all the alphabets in the middle row of the keyboard
  List<Alphabet> rowTwo = [
    Alphabet(value: 'a'),
    Alphabet(value: 's'),
    Alphabet(value: 'd'),
    Alphabet(value: 'f'),
    Alphabet(value: 'g'),
    Alphabet(value: 'h'),
    Alphabet(value: 'j'),
    Alphabet(value: 'k'),
    Alphabet(value: 'l'),
  ];

  //List containing all the alphabets in the bottom row of the keyboard
  List<Alphabet> rowThree = [
    Alphabet(value: 'z'),
    Alphabet(value: 'x'),
    Alphabet(value: 'c'),
    Alphabet(value: 'v'),
    Alphabet(value: 'b'),
    Alphabet(value: 'n'),
    Alphabet(value: 'm'),
  ];
}
