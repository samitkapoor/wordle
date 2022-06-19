import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wordle/components/my_key.dart';
import 'package:wordle/controllers/action.dart';
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
  ActionController actionController = Get.find<ActionController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wordle'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ActionController>(builder: (controller) {
              return ListView(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                children: [
                  ...controller.wordSlotController.wordSlots.map(
                    (wordSlot) {
                      if (wordSlot['visibility'] == true) {
                        return Row(
                          children: [
                            ...wordSlot['slots'].map(
                              (cell) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  margin: const EdgeInsets.all(5),
                                  height:
                                      (MediaQuery.of(context).size.width - 70) /
                                          5,
                                  width:
                                      (MediaQuery.of(context).size.width - 70) /
                                          5,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3, color: Colors.black),
                                    borderRadius: BorderRadius.circular(5),
                                    color: cell.color,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    cell.value,
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 32,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
              );
            }),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            height: 160,
            width: double.infinity,
            child: Column(
              children: [
                buildKeyboardRow(
                  row: actionController.keyboardController.rowOne,
                  actionController: actionController,
                ),
                buildKeyboardRow(
                  row: actionController.keyboardController.rowTwo,
                  actionController: actionController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          actionController.onPressBackSpace();
                        },
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
                    buildKeyboardRow(
                      row: actionController.keyboardController.rowThree,
                      actionController: actionController,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          actionController.onPressEnter();
                        },
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

  Container buildKeyboardRow(
      {required List row, required ActionController actionController}) {
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
