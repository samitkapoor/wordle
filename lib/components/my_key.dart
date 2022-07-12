import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wordle/controllers/action.dart';
import 'package:wordle/models/alphabet.dart';

//A row in a keyboard contains some alphabets
//Those alphabets are buttons or keys of keyboard
//Each key of the keyboard will look like the widget defined below

// ignore: must_be_immutable
class MyKey extends StatelessWidget {
  MyKey({
    Key? key,
    required this.alphabet,
  }) : super(key: key);

  //This variable contains the information about the key that we are currently rendering
  Alphabet alphabet;

  ActionController actionController = Get.find<ActionController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: 40,
      width: (MediaQuery.of(context).size.width - 10 - 40) / 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:
            actionController.keyboard.disabledAlphabets.contains(alphabet.value)
                ? Colors.grey
                : actionController.keyboard.notInPlaceAlphabets
                        .contains(alphabet.value)
                    ? Colors.orange
                    : actionController.keyboard.correctAlphabets
                            .contains(alphabet.value)
                        ? Colors.green
                        : Theme.of(context).primaryColor,
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
