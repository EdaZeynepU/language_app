import 'package:flutter/material.dart';
import 'package:language_app/constants/main_colors.dart';
import 'package:language_app/data/basic.dart';
import 'package:language_app/language_learning_interactives/connect.dart';

import '../language_learning_interactives/word_practice.dart';

class InsideCategory extends StatefulWidget {
  final String category;
  const InsideCategory({super.key, required this.category});

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
      backgroundColor: MainColors.orangeSoftColor,
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
      case "Basic 1":
        base=basic1;
      case "Greetings":
        base=greetings;

    }
    for (var structure in base) {
      // gerEng[structure.german] = structure.english;
      selectedMap[structure.english] = structure.turkish;
      // trGer[structure.turkish] = structure.german;
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

