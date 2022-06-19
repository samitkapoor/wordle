import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle/constants/words.dart';
import 'package:wordle/controllers/action.dart';

Future<void> randomNumberGenerator() {
  ActionController actionController = Get.find<ActionController>();

  Random random = Random();

  int x = random.nextInt(words.length);

  actionController.setWordToWin(words[x]);
  return Future.value();
}
