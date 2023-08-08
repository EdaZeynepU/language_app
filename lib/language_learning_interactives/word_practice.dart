import 'package:flutter/material.dart';
import 'package:language_app/constants/main_colors.dart';
import 'dart:math';

class WordPractice extends StatefulWidget {
  final Map<String,String> words;
  const WordPractice({super.key,required this.words});

  @override
  State<WordPractice> createState() => _WordPracticeState();
}



class _WordPracticeState extends State<WordPractice> {
  int randomNum=Random().nextInt(10);
  late Map<String,String> shouldSeeMap;

  @override
  void initState() {
    shouldSeeMap= Map.from(widget.words);;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.lightSecondaryColor,
      body: Center(
        child: Column(
              children: widget.words.keys.map((e) =>GestureDetector(
              child: Text("${e}"),
              )).toList()..shuffle(Random(randomNum))
        ),
      ),
    );
  }
}


