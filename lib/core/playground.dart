import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/components/my_key.dart';
import 'package:wordle/controllers/keyboard.dart';

class MyPlayground extends StatelessWidget {
  MyPlayground({super.key});

  Keyboard keyboardController = Keyboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wordle'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            height: 160,
            width: double.infinity,
            child: Column(
              children: [
                buildKeyboardRow(row: keyboardController.rowOne),
                buildKeyboardRow(row: keyboardController.rowTwo),
                buildKeyboardRow(row: keyboardController.rowThree),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildKeyboardRow({required row}) {
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
                onTap: () {},
                child: MyKey(
                  alphabet: alphabet,
                  keys: row.length,
                ),
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
