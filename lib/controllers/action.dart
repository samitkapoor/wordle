import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle/constants/words.dart';
import 'package:wordle/controllers/keyboard.dart';
import 'package:wordle/controllers/word_slot.dart';
import 'package:wordle/utils/random_number_generator.dart';

class ActionController extends GetxController {
  Keyboard keyboardController = Keyboard();
  WordSlot wordSlotController = WordSlot();

  bool first = true;

  int inputNumber = 0;

  String wordToWin = '';

  List<String> inputs = ['', '', '', '', '', ''];

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      await randomNumberGenerator();
      print(wordToWin);
    });
    super.onInit();
  }

  void setWordToWin(String value) {
    wordToWin = value;

    update();
  }

  void onKeyPress(String value) {
    if (inputs[inputNumber].length < 5) {
      inputs[inputNumber] += value.toUpperCase();
      wordSlotController
          .wordSlots[inputNumber]['slots'][inputs[inputNumber].length - 1]
          .value = value.toUpperCase();

      update();
    }
  }

  void onPressBackSpace() {
    if (inputs[inputNumber].isNotEmpty) {
      inputs[inputNumber] =
          inputs[inputNumber].substring(0, inputs[inputNumber].length - 1);
      wordSlotController
          .wordSlots[inputNumber]['slots'][inputs[inputNumber].length]
          .value = '';

      update();
    }
  }

  bool findInList(String target) {
    for (int i = 0; i < words.length; i++) {
      if (words[i] == target) {
        return true;
      }
    }
    return false;
  }

  bool findInString(String base, String target) {
    for (int i = 0; i < base.length; i++) {
      if (base[i] == target) return true;
    }
    return false;
  }

  void onPressEnter() {
    String input = inputs[inputNumber].toLowerCase();

    if (inputs[inputNumber].length == 5 && findInList(input)) {
      for (int i = 0; i < 5; i++) {
        if (wordToWin[i] == input[i]) {
          wordSlotController.wordSlots[inputNumber]['slots'][i].color =
              Colors.green;
        } else if (findInString(wordToWin, input[i])) {
          wordSlotController.wordSlots[inputNumber]['slots'][i].color =
              Colors.orange;
        }
      }

      inputNumber += 1;
      wordSlotController.wordSlots[inputNumber]['visibility'] = true;

      update();
    }
  }
}
