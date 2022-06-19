import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wordle/models/alphabet.dart';

//Each key in keyboard will look like this widget

// ignore: must_be_immutable
class MyKey extends StatelessWidget {
  MyKey({
    Key? key,
    required this.alphabet,
  }) : super(key: key);

  Alphabet alphabet;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: 40,
      width: (MediaQuery.of(context).size.width - 10 - 40) / 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).primaryColor,
      ),
      alignment: Alignment.center,
      child: Text(
        alphabet.value,
        style: GoogleFonts.openSans(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
