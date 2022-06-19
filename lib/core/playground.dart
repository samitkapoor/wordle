import 'package:flutter/material.dart';

import 'package:wordle/components/my_key.dart';
import 'package:wordle/controllers/keyboard.dart';
import 'package:wordle/controllers/word_slot.dart';
import 'package:wordle/utils/random_number_generator.dart';

// ignore: must_be_immutable
class MyPlayground extends StatefulWidget {
  const MyPlayground({super.key});

  @override
  State<MyPlayground> createState() => _MyPlaygroundState();
}

class _MyPlaygroundState extends State<MyPlayground> {
  Keyboard keyboardController = Keyboard();

  WordSlot wordSlotController = WordSlot();

  @override
  Widget build(BuildContext context) {
    randomNumberGenerator();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wordle'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                ...wordSlotController.wordSlots.map(
                  (wordSlot) {
                    if (wordSlot['visibility'] == true) {
                      return Row(
                        children: [
                          ...wordSlot['slots'].map(
                            (cell) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                height:
                                    (MediaQuery.of(context).size.width - 70) /
                                        5,
                                width:
                                    (MediaQuery.of(context).size.width - 70) /
                                        5,
                                color: cell.color,
                              );
                            },
                          ).toList(),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ).toList(),
              ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          height: 40,
                          width: (MediaQuery.of(context).size.width - 10 - 40) /
                              10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Theme.of(context).primaryColor,
                          ),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.backspace_outlined,
                          ),
                        ),
                      ),
                    ),
                    buildKeyboardRow(row: keyboardController.rowThree),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          height: 40,
                          width: (MediaQuery.of(context).size.width - 10 - 40) /
                              10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Theme.of(context).primaryColor,
                          ),
                          alignment: Alignment.center,
                          child: Container(
                            height: 30,
                            width: 25,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/enter.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                ),
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
