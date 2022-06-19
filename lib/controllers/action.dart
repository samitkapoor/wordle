import 'package:get/get.dart';

class ActionController extends GetxController {
  bool first = true;
  int tryNumber = 1;
  String currentString = '';
  String wordToWin = '';

  void setWordToWin(String value) {
    wordToWin = value;
    update();
  }

  void onKeyPress(String value) {
    if (currentString.length <= 5) currentString += value;

    update();
  }
}
