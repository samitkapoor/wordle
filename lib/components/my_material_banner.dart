import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wordle/controllers/action.dart';

MaterialBanner MyMaterialBanner(
    {required bool win, required BuildContext context}) {
  ActionController actionController = Get.find<ActionController>();

  String message = '';

  if (actionController.inputNumber == 0 && win) {
    message = 'Amazing!';
  } else if (actionController.inputNumber == 1 && win) {
    message = 'Splendid!';
  } else if ((actionController.inputNumber == 2 ||
          actionController.inputNumber == 3) &&
      win) {
    message = 'Great Job!';
  } else if (win) {
    message = 'Good Job!';
  }

  return MaterialBanner(
    forceActionsBelow: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Text(
      win ? message : actionController.wordToWin,
      textAlign: TextAlign.center,
    ),
    contentTextStyle: GoogleFonts.aBeeZee(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
    actions: [
      InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).clearMaterialBanners();
        },
        child: Container(
          height: 32,
          width: 32,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/dismiss.png'),
            ),
          ),
        ),
      ),
    ],
  );
}
