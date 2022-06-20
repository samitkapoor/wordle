import 'package:flutter/material.dart';
import 'package:wordle/components/my_key.dart';
import 'package:wordle/controllers/action.dart';

class MyKeyboardRow extends StatelessWidget {
  MyKeyboardRow({super.key, required this.row, required this.actionController});

  List row;

  ActionController actionController;

  @override
  Widget build(BuildContext context) {
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
                  actionController.onKeyPress(alphabet.value);
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
  }
}
