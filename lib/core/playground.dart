import 'package:flutter/material.dart';

class MyPlayground extends StatelessWidget {
  const MyPlayground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wordle'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            height: 160,
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
