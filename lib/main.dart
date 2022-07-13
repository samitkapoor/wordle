import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/constants/colors.dart';

import 'package:wordle/controllers/action.dart';
import 'package:wordle/core/playground.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ActionController actionController = Get.put(ActionController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wordle',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.aBeeZee(
            fontSize: 24,
            color: Colors.white,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
          ),
        ),
        textTheme: const TextTheme(),
        colorScheme: const ColorScheme.dark(),
        primaryColor: primaryColor,
        scaffoldBackgroundColor: const Color(0xff000500),
      ),
      home: MyPlayground(),
    );
  }
}
