import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle/components/my_material_banner.dart';
import 'package:wordle/constants/words.dart';
import 'package:wordle/controllers/keyboard.dart';
import 'package:wordle/controllers/word_slot.dart';
import 'package:wordle/utils/random_number_generator.dart';

class ActionController extends GetxController {
  Keyboard keyboardController = Keyboard();
  WordSlot wordSlotController = WordSlot();

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

  void onReset() {
    keyboardController = Keyboard();
    wordSlotController = WordSlot();
    inputNumber = 0;
    randomNumberGenerator();
    inputs = ['', '', '', '', '', ''];
    update();
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

  void onPressEnter({required BuildContext context}) {
    String input = '';
    if (inputNumber <= 5) {
      input = inputs[inputNumber].toLowerCase();
    }

    if (inputNumber == 6) {
      onReset();
    } else if (inputNumber <= 5 &&
        inputs[inputNumber].length == 5 &&
        findInList(input)) {
      for (int i = 0; i < 5; i++) {
        if (wordToWin[i] == input[i]) {
          wordSlotController.wordSlots[inputNumber]['slots'][i].color =
              Colors.green;
        } else if (findInString(wordToWin, input[i])) {
          wordSlotController.wordSlots[inputNumber]['slots'][i].color =
              Colors.orange;
        }
      }
      if (inputs[inputNumber].toLowerCase() == wordToWin) {
        ScaffoldMessenger.of(context)
            .showMaterialBanner(MyMaterialBanner(win: true));
        update();
        return;
      }

      inputNumber += 1;
      if (inputNumber <= 5) {
        wordSlotController.wordSlots[inputNumber]['visibility'] = true;
      }

      if (inputNumber == 6) {
        ScaffoldMessenger.of(context)
            .showMaterialBanner(MyMaterialBanner(win: false));
      }

      update();
    }
  }
}
