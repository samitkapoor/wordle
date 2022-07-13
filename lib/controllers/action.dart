import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wordle/components/my_material_banner.dart';
import 'package:wordle/constants/colors.dart';
import 'package:wordle/constants/guesses.dart';
import 'package:wordle/data/keyboard.dart';
import 'package:wordle/data/word_slot.dart';
import 'package:wordle/utils/random_number_generator.dart';

//All the logic of the game resides in this controllers

class ActionController extends GetxController {
  Keyboard keyboard = Keyboard();
  WordSlot wordSlot = WordSlot();

  //This variable keeps track about how many tries are left
  int inputNumber = 0;

  //When a new round starts, this variable is filled with the word that needs to be guessed
  String wordToWin = '';

  //This variable will be set to true when the game ends
  bool gameEnd = false;

  //All our 6 tries are stored in this list of strings
  List<String> inputs = ['', '', '', '', '', ''];

  @override
  void onInit() {
    //Whenever our app is live, a random word will get selected from words.dart
    Future.delayed(const Duration(seconds: 1)).then((val) async {
      await randomNumberGenerator();
    });
    super.onInit();
  }

  //When we reset the game, we set all the values to out initial values
  void onReset(BuildContext context) {
    ScaffoldMessenger.of(context).clearMaterialBanners();
    keyboard.reset();
    wordSlot.reset();
    inputNumber = 0;
    gameEnd = false;
    randomNumberGenerator();
    inputs = ['', '', '', '', '', ''];
    update();
  }

  //This function will set the word that needs to be guessed
  void setWordToWin(String value) {
    wordToWin = value;

    update();
  }

  //This function will be called whenever we press a key from keyboard
  void onKeyPress(String value) {
    if (!gameEnd && inputs[inputNumber].length < 5) {
      inputs[inputNumber] += value.toUpperCase();
      wordSlot.wordSlots[inputNumber]['slots'][inputs[inputNumber].length - 1]
          .value = value.toUpperCase();

      update();
    }
  }

  //This function will be pressed when backspace is pressed
  void onPressBackSpace() {
    if (!gameEnd && inputs[inputNumber].isNotEmpty) {
      inputs[inputNumber] =
          inputs[inputNumber].substring(0, inputs[inputNumber].length - 1);
      wordSlot.wordSlots[inputNumber]['slots'][inputs[inputNumber].length]
          .value = '';

      update();
    }
  }

  //This function finds a string inside the list
  bool findInList({required List<String> list, required String target}) {
    for (int i = 0; i < list.length; i++) {
      if (list[i] == target) {
        return true;
      }
    }
    return false;
  }

  //This function will find if the target(char) is present in the base string or not
  bool findInString(String base, String target) {
    for (int i = 0; i < base.length; i++) {
      if (base[i] == target) return true;
    }
    return false;
  }

  //This function will be called everytime we press enter key
  void onPressEnter({required BuildContext context}) {
    if (inputNumber == 6 || gameEnd) {
      onReset(context);
      return;
    }

    String input = '';
    input = inputs[inputNumber].toLowerCase();
    if (findInList(list: guesses, target: input)) {
      if (!gameEnd &&
          inputNumber <= 5 &&
          inputs[inputNumber].length == 5 &&
          findInList(list: guesses, target: input)) {
        //set the color of the cell accordingly
        for (int i = 0; i < 5; i++) {
          if (wordToWin[i] == input[i]) {
            wordSlot.wordSlots[inputNumber]['slots'][i].color = inPlaceColor;
            keyboard.correctAlphabets.add(input[i]);
          } else if (findInString(wordToWin, input[i])) {
            wordSlot.wordSlots[inputNumber]['slots'][i].color = notInPlaceColor;
            keyboard.notInPlaceAlphabets.add(input[i]);
          } else {
            keyboard.disabledAlphabets.add(input[i]);
          }
        }
        update();

        //if the word input by the user is the word that we are guessing, then he won
        if (inputs[inputNumber].toLowerCase() == wordToWin) {
          ScaffoldMessenger.of(context).showMaterialBanner(
              MyMaterialBanner(win: true, context: context));
          gameEnd = true;
          update();
          return;
        }

        //else just increase the inputNumber
        inputNumber += 1;
        if (inputNumber <= 5) {
          wordSlot.wordSlots[inputNumber]['visibility'] = true;
        }

        //if inputNumber == 6 and the game hasn't ended yet then that means the user couldn't guess the word
        if (inputNumber == 6) {
          ScaffoldMessenger.of(context).showMaterialBanner(
              MyMaterialBanner(win: false, context: context));
          gameEnd = true;
        }

        update();
      }
    }
  }
}
