import 'package:wordle/models/alphabet.dart';

class Keyboard {
  //All the disabled alphabets will be stored inside this list
  List<String> disabledAlphabets = [];

  //List containing all the alphabets in the top row of the keyboard
  List<Alphabet> rowOne = [
    Alphabet(value: 'q', position: 0),
    Alphabet(value: 'w', position: 0),
    Alphabet(value: 'e', position: 0),
    Alphabet(value: 'r', position: 0),
    Alphabet(value: 't', position: 0),
    Alphabet(value: 'y', position: 0),
    Alphabet(value: 'u', position: 0),
    Alphabet(value: 'i', position: 0),
    Alphabet(value: 'o', position: 0),
    Alphabet(value: 'p', position: 0),
  ];

  //List containing all the alphabets in the middle row of the keyboard
  List<Alphabet> rowTwo = [
    Alphabet(value: 'a', position: 0),
    Alphabet(value: 's', position: 0),
    Alphabet(value: 'd', position: 0),
    Alphabet(value: 'f', position: 0),
    Alphabet(value: 'g', position: 0),
    Alphabet(value: 'h', position: 0),
    Alphabet(value: 'j', position: 0),
    Alphabet(value: 'k', position: 0),
    Alphabet(value: 'l', position: 0),
  ];

  //List containing all the alphabets in the bottom row of the keyboard
  List<Alphabet> rowThree = [
    Alphabet(value: 'z', position: 0),
    Alphabet(value: 'x', position: 0),
    Alphabet(value: 'c', position: 0),
    Alphabet(value: 'v', position: 0),
    Alphabet(value: 'b', position: 0),
    Alphabet(value: 'n', position: 0),
    Alphabet(value: 'm', position: 0),
  ];
}
