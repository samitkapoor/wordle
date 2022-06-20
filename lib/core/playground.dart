import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/components/keyboard_row.dart';

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
                MyKeyboardRow(
                  row: actionController.keyboardController.rowOne,
                  actionController: actionController,
                ),
                MyKeyboardRow(
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
                    MyKeyboardRow(
                      row: actionController.keyboardController.rowThree,
                      actionController: actionController,
                    ),
                    GetBuilder<ActionController>(builder: (controller) {
                      return Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.onPressEnter(context: context);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            height: 40,
                            width:
                                (MediaQuery.of(context).size.width - 10 - 40) /
                                    10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Theme.of(context).primaryColor,
                            ),
                            alignment: Alignment.center,
                            child: Container(
                              height: 30,
                              width: 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      (controller.gameEnd == false)
                                          ? 'assets/icons/enter.png'
                                          : 'assets/icons/reset.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
