import 'package:flutter/material.dart';

import 'package:wordle/constants/colors.dart';

class Cell {
  String value;
  Color color;

  Cell({
    required this.value,
    this.color = primaryColor,
  });
}
