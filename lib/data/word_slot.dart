import 'package:flutter/material.dart';
import 'package:wordle/constants/colors.dart';
import 'package:wordle/constants/words.dart';
import 'package:wordle/models/cell.dart';

class WordSlot {
  void reset() {
    for (int i = 0; i < wordSlots.length; i++) {
      wordSlots[i]['visibility'] = false;

      for (int j = 0; j < wordSlots[i]['slots'].length; j++) {
        wordSlots[i]['slots'][j].value = '';
        wordSlots[i]['slots'][j].color = primaryColor;
      }
    }
    wordSlots[0]['visibility'] = true;
  }

  List<Map<String, dynamic>> wordSlots = [
    {
      'visibility': true,
      'slots': [
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
      ],
    },
    {
      'visibility': false,
      'slots': [
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
      ],
    },
    {
      'visibility': false,
      'slots': [
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
      ],
    },
    {
      'visibility': false,
      'slots': [
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
      ],
    },
    {
      'visibility': false,
      'slots': [
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
      ],
    },
    {
      'visibility': false,
      'slots': [
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
        Cell(value: ''),
      ],
    },
  ];
}
