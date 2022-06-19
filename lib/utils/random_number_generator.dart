import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:wordle/constants/words.dart';
import 'package:wordle/controllers/action.dart';

void randomNumberGenerator() {
  ActionController actionController = ActionController();

  Random random = Random();

  int x = random.nextInt(words.length);

  actionController.setWordToWin(words[x]);
}
