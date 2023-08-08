import 'dart:math';
import 'package:flutter/material.dart';
import 'package:language_app/constants/main_colors.dart';

class ConnectGame extends StatefulWidget {
  final Map<String,String> words;
  const ConnectGame({super.key, required this.words});

  @override
  State<ConnectGame> createState() => _ConnectGameState();
}

class _ConnectGameState extends State<ConnectGame> {
  int randomNum1=Random().nextInt(10);
  int randomNum2=Random().nextInt(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.lightGray,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:widget.words.keys.map((e) => Draggable(
                      data: e,
                      feedback: dragObjextContainer(text: e,bg:MainColors.blueSoftColor),
                      child: widget.words[e]=="+" ? dragObjextContainer(text: "", bg: MainColors.correctAnswer): dragObjextContainer(text: e,bg:MainColors.blueSoftColor),
                      childWhenDragging: dragObjextContainer(text: "",bg:MainColors.gray),
                    )).toList()..shuffle(Random(randomNum1)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.words.keys.map((e) => _buildDraggableTarget(e)).toList()..shuffle(Random(randomNum2)))

              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildDraggableTarget(x){
    return DragTarget(builder: (context, candidateData, rejectedData) {
      if(widget.words[x]=="+"){
        // return dragObjextContainer(text: "",bg: MainColors.correctAnswer,);
      return Icon(Icons.done_sharp);
      }else{
        return dragObjextContainer(text: "${widget.words[x]}",bg: MainColors.pinkSoftColor,);
      }

    },
      onWillAccept: (data) => data == x,
      onAccept: (data){
      print("on accept çalıştı");
      setState(() {
        widget.words[x] = "+";
      });
      },
      onLeave: (data){

        print("on leave çalıştı");
      },

    );
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
          color: widget.bg,
          borderRadius: BorderRadius.all(Radius.circular(15))

        ),
        child: Text("${widget.text}",style: TextStyle(fontSize: 18),textAlign: TextAlign.center),
      ),
    );
  }
}

