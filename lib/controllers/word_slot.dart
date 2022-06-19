import 'package:get/get.dart';

import 'package:wordle/models/cell.dart';

class WordSlot extends GetxController {
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
