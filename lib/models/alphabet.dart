class Alphabet {
  //value can be 'a', 'b', 'c', 'd', etc
  var value;
  //on which position is the alphabet placed inside the word
  int position;

  bool disabled;

  Alphabet(
      {required this.value, required this.position, this.disabled = false});
}
