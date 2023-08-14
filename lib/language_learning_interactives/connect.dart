import 'dart:math';
import 'package:flutter/material.dart';
import 'package:language_app/constants/main_colors.dart';
import 'package:language_app/language_learning_interactives/game_complete.dart';

class ConnectGame extends StatefulWidget {
  final Map<String, String> words;
  const ConnectGame({super.key, required this.words});

  @override
  State<ConnectGame> createState() => _ConnectGameState();
}

class _ConnectGameState extends State<ConnectGame> {
  late int randomNum1;
  late int randomNum2;
  late int endPoint;
  late Map<String, String> words;

  late List<String> firstKeys;
  late List<String> firstValues;
  late List<String> secondKeys;
  late List<String> secondValues;
  late int pageTracker;

  var page=0;

  @override
  void initState() {
    restartInitHelper();
    super.initState();
  }

  void restartInitHelper() {
    randomNum1 = Random().nextInt(10);
    randomNum2 = Random().nextInt(4);
    List<MapEntry<String, String>> entries = widget.words.entries.toList();
    words = Map.fromEntries(entries);
    pageTracker=words.length~/2;
    firstKeys=words.keys.toList().sublist(0,words.length~/2);
    secondKeys=words.keys.toList().sublist(words.length~/2,words.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  MainColors.lightGray,
      appBar: AppBar(
        backgroundColor: Color(0x61989898),
          actions: [TextButton(onPressed: () => setState(() {
            restartInitHelper();
          }), child: Text("Reset"))]),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: page <=1 ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: page ==0 ? (firstKeys
                      .map((e) => Draggable(
                            data: e,
                            feedback: dragObjextContainer(
                                text: e, bg: Color(0xF4D8F8FF)),
                            child: words[e] == "+"
                                ? TrueAnswerBox()
                                : dragObjextContainer(
                                    text: e, bg: Color(0xF4D8F8FF)),
                            childWhenDragging: dragObjextContainer(
                                text: "", bg: MainColors.gray),
                          )).toList()..shuffle(Random(randomNum1))) : (secondKeys
                      .map((e) => Draggable(
                    data: e,
                    feedback: dragObjextContainer(
                        text: e, bg: MainColors.blueSoftColor),
                    child: words[e] == "+"
                        ? TrueAnswerBox()
                        : dragObjextContainer(
                        text: e, bg: MainColors.blueSoftColor),
                    childWhenDragging: dragObjextContainer(
                        text: "", bg: MainColors.gray),
                  )).toList()..shuffle(Random(randomNum1)))
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        page==0 ?
                        (firstKeys.map((e) => _buildDraggableTarget(e)).toList()
                          ..shuffle(Random(randomNum2))):(secondKeys.map((e) => _buildDraggableTarget(e)).toList()
                          ..shuffle(Random(randomNum2))))
              ],
            ) : GameComplete()
          ),
        ),
      ),
    );
  }

  Widget _buildDraggableTarget(x) {
    return DragTarget(
      builder: (context, candidateData, rejectedData) {
        if (words[x] == "+") {
          return TrueAnswerBox();
        } else {
          return dragObjextContainer(
            text: "${words[x]}",
            bg: Color(0xF4FFE7EE),
          );
        }
      },
      onWillAccept: (data) => data == x,
      onAccept: (data) {
        print("on accept çalıştı");
        setState(() {
          words[x] = "+";
          pageTracker-=1;
          if(pageTracker==0){
            page+=1;
            pageTracker=secondKeys.length;
          }
        });
      },
      onLeave: (data) {
        print("on leave çalıştı");
      },
    );
  }
}

class TrueAnswerBox extends StatelessWidget {
  const TrueAnswerBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: MainColors.correctAnswer,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Icon(Icons.done_sharp));
  }
}

class dragObjextContainer extends StatefulWidget {
  final text;
  final bg;
  const dragObjextContainer({
    super.key,
    required this.text,
    required this.bg,
  });

  @override
  State<dragObjextContainer> createState() => _dragObjextContainerState();
}

class _dragObjextContainerState extends State<dragObjextContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 0, //extend the shadow
                  offset: Offset(
                    0, // Move to right 10  horizontally
                    0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            color: widget.bg,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Center(
          child: Text("${widget.text}",
              style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
