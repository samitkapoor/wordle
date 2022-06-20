import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle/controllers/action.dart';

MaterialBanner MyMaterialBanner({required bool win}) {
  ActionController actionController = Get.find<ActionController>();

  return MaterialBanner(
    forceActionsBelow: false,
    content: Text(win ? 'You won' : actionController.wordToWin),
    actions: [
      const SizedBox(),
    ],
  );
}
