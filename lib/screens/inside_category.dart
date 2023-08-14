import 'package:flutter/material.dart';
import 'package:language_app/constants/main_colors.dart';
import 'package:language_app/data/basic.dart';
import 'package:language_app/language_learning_interactives/connect.dart';

import '../language_learning_interactives/word_practice.dart';

class InsideCategory extends StatefulWidget {
  final String category;
  final String language;
  final String targetLanguage;
  const InsideCategory({super.key, required this.category, required this.language, required this.targetLanguage,});

  @override
  State<InsideCategory> createState() => _InsideCategoryState();
}


class _InsideCategoryState extends State<InsideCategory> {
  Map<String,String> selectedMap={};
  @override
  void initState() {
    getDatas();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton:  FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back,color:MainColors.primaryColor ),
        backgroundColor: MainColors.lightPrimaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      backgroundColor: MainColors.lightGray,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => WordPractice(words: selectedMap),));
              }, child: Text("Words",style: TextStyle(fontSize: 30),),style: buttonStyle(MainColors.lightPrimaryColor),),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ConnectGame(words: selectedMap),));
              }, child: Text("Connect",style: TextStyle(fontSize: 30),),style: buttonStyle(MainColors.secondaryColor),),
              ElevatedButton(onPressed: (){}, child: Text("Quiz",style: TextStyle(fontSize: 30),),style: buttonStyle(MainColors.lightSecondaryColor),),
            ],
          ),
        ),
      ),
    );
  }

  void getDatas(){
    List<Structure> base=[];
    switch (widget.category){
      case "Basics 1":
        base=basic1;
      case "Greetings":
        base=greetings;
      case "Family 1":
        base=family1;
      case "Family 2":
        base=family2;
      case "Food":
        base=food;
      case "Numbers 1":
        base=numbers1;
    }

    //find best practise for this
    for (var structure in base) {
      var from;
      var to;
      switch (widget.language){
        case "tr":
          from=structure.turkish;
        case "eng":
          from=structure.english;
        case "de":
          from=structure.german;
        case "nl":
          from=structure.dutch;
      }
      switch (widget.targetLanguage){
        case "tr":
          to=structure.turkish;
        case "eng":
          to=structure.english;
        case "de":
          to=structure.german;
        case "nl":
          to=structure.dutch;
      }
      selectedMap[to] = from;
    }
  }
}

  ButtonStyle buttonStyle(Color bg) {
    return TextButton.styleFrom(
        backgroundColor: bg, fixedSize: Size(190, 190),
       shadowColor: Colors.black,
      elevation: 10,

    );
  }

