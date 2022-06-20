import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wordle/components/my_key.dart';
import 'package:wordle/controllers/action.dart';

//There are three rows containing alphabets in a keyboard
//Each row in a keyboard will look like this widget

// ignore: must_be_immutable
class MyKeyboardRow extends StatelessWidget {
  MyKeyboardRow({super.key, required this.row, required this.actionController});

  //List containing all the alphabets that are present in the row
  List row;

  ActionController actionController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActionController>(builder: (controller) {
      return Container(
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...row.map(
              (alphabet) {
                return InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    controller.onKeyPress(alphabet.value);
                  },
                  child: MyKey(
                    alphabet: alphabet,
                  ),
                );
              },
            ).toList(),
          ],
        ),
      );
    });
  }
}
