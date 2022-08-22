import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/models/cell.dart';

class FillBoxWidget extends StatelessWidget {
  FillBoxWidget({Key? key, required this.cell}) : super(key: key);

  Cell cell;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.all(5),
      height: (MediaQuery.of(context).size.width - 70) / 5,
      width: (MediaQuery.of(context).size.width - 70) / 5,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.black),
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
  }
}
