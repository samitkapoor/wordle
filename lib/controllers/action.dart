import 'package:get/get.dart';
import 'package:wordle/constants/words.dart';
import 'package:wordle/controllers/keyboard.dart';
import 'package:wordle/controllers/word_slot.dart';

class ActionController extends GetxController {
  Keyboard keyboardController = Keyboard();
  WordSlot wordSlotController = WordSlot();

  bool first = true;

  int inputNumber = 0;

  String wordToWin = '';

  List<String> inputs = ['', '', '', '', '', ''];

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

  void onPressEnter() {
    if (inputs[inputNumber].length == 5 &&
        words.contains(inputs[inputNumber].toLowerCase())) {
      inputNumber += 1;
      wordSlotController.wordSlots[inputNumber]['visibility'] = true;

      update();
    }
  }
}
