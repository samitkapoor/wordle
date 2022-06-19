import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/core/playground.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wordle',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.aBeeZee(
            fontSize: 24,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
          ),
        ),
        textTheme: const TextTheme(),
        colorScheme: const ColorScheme.dark(),
        primaryColor: const Color(0xff007EA7),
        scaffoldBackgroundColor: const Color(0xff003249),
        cardColor: const Color(0xff80CED7),
        hintColor: const Color(0xff9AD1D4),
        canvasColor: const Color(0xffCCDBDC),
      ),
      home: const MyPlayground(),
    );
  }
}
