// import 'package:flutter/material.dart';
// import 'package:language_app/constants/main_colors.dart';
// import 'dart:math';
//
// class WordPractice extends StatefulWidget {
//   final Map<String,String> words;
//   const WordPractice({super.key,required this.words});
//
//   @override
//   State<WordPractice> createState() => _WordPracticeState();
// }
//
//
//
// class _WordPracticeState extends State<WordPractice> {
//   int randomNum=Random().nextInt(10);
//   late Map<String,String> shouldSeeMap;
//   List<Widget> widgetList=[];
//   int startIndex=0;
//   List<String> translateList=[];
//
//   @override
//   void initState() {
//     shouldSeeMap= Map.from(widget.words);
//     widget.words.forEach((key, value) {
//       widgetList.add(
//         GestureDetector(
//           onTap: () {
//             setState(() {
//
//               if (translateList.contains(key)){
//                 translateList.remove(key);
//               }else{
//                 translateList.add(key);
//               }
//               print(translateList);
//             });
//           },
//           child: Container(
//             width: 150,
//             height: 150,
//             color: Colors.blue,
//             child: translateList.contains(key) ? Center(child: Text(value)) : Center(child: Text(key)),
//           ),
//         )
//       );
//     });
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // backgroundColor: Color(0xFFB1D0E8),
//         backgroundColor: Color(0x77595959),
//       ),
//       backgroundColor: MainColors.lightSecondaryColor,
//       body: SafeArea(
//         child: Center(
//           child: Column(
//                 children: [
//                   Expanded(
//                     flex: 10,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     // crossAxisAlignment: CrossAxisAlignment.center,
//                     //   children: widget.words.keys.map((e) =>GestureDetector(
//                     //   child: Text("${e}"),
//                     // )).toList()..shuffle(Random(randomNum)),
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: widgetList.length-startIndex >= 2 ? widgetList.sublist(startIndex,startIndex+2) : widgetList.sublist(startIndex,widgetList.length)
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: widgetList.length-startIndex >= 4 ? widgetList.sublist(startIndex+2,startIndex+4) : widgetList.length-startIndex == 3 ? widgetList.sublist(startIndex+2,widgetList.length-1):[]
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [ElevatedButton(onPressed: (){
//                       setState(() {
//                         if(startIndex>=4)
//                         startIndex-=4;
//                       });
//                     }, child: Icon(Icons.arrow_back)),
//                       ElevatedButton(onPressed: (){
//                         setState(() {
//                           if(widgetList.length-startIndex> 3)
//                           startIndex+=4;
//                         });
//                       }, child: Icon(Icons.arrow_forward))],
//                 ),
//                   )]
//           ),
//         ),
//       ),
//     );
//   }
//
// }

import 'package:flutter/material.dart';
import 'package:language_app/constants/main_colors.dart';
import 'dart:math';

class WordPractice extends StatefulWidget {
  final Map<String, String> words;
  const WordPractice({super.key, required this.words});

  @override
  State<WordPractice> createState() => _WordPracticeState();
}

class _WordPracticeState extends State<WordPractice> {
  int randomNum = Random().nextInt(10);
  late Map<String, String> shouldSeeMap;
  List<Widget> widgetList = [];
  List<String> keyList = [];
  int startIndex = 0;
  List<String> translateList = [];

  @override
  void initState() {
    shouldSeeMap = Map.from(widget.words);
    widget.words.forEach((key, value) {
      // widgetList.add(GestureDetector(
      //   onTap: () {
      //     setState(() {
      //       if (translateList.contains(key)) {
      //         translateList.remove(key);
      //       } else {
      //         translateList.add(key);
      //       }
      //       print(translateList);
      //     });
      //   },
      //   child: Container(
      //     width: 150,
      //     height: 150,
      //     color: Colors.blue,
      //     child: translateList.contains(key)
      //         ? Center(child: Text(value))
      //         : Center(child: Text(key)),
      //   ),
      // ));
      keyList.add(key);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFFB1D0E8),
        backgroundColor: Color(0x77595959),
      ),
      backgroundColor: MainColors.lightSecondaryColor,
      body: SafeArea(
        child: Center(
          child: Column(children: [
            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widgetList.length - startIndex >= 2
                          ? [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (translateList
                                        .contains(keyList[startIndex])) {
                                      translateList.remove(keyList[startIndex]);
                                    } else {
                                      translateList.add(keyList[startIndex]);
                                    }
                                    print(translateList);
                                  });
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  color: Colors.blue,
                                  child: translateList
                                          .contains(keyList[startIndex])
                                      ? Center(
                                          child: Text(shouldSeeMap[
                                              keyList[startIndex]]!))
                                      : Center(
                                          child: Text(keyList[startIndex]!)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (translateList
                                        .contains(keyList[startIndex + 1])) {
                                      translateList
                                          .remove(keyList[startIndex + 1]);
                                    } else {
                                      translateList
                                          .add(keyList[startIndex + 1]);
                                    }
                                    print(translateList);
                                  });
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  color: Colors.blue,
                                  child: translateList
                                          .contains(keyList[startIndex + 1])
                                      ? Center(
                                          child: Text(shouldSeeMap[
                                              keyList[startIndex + 1]]!))
                                      : Center(
                                          child:
                                              Text(keyList[startIndex + 1]!)),
                                ),
                              )
                            ]
                          : [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (translateList
                                        .contains(keyList[startIndex])) {
                                      translateList.remove(keyList[startIndex]);
                                    } else {
                                      translateList.add(keyList[startIndex]);
                                    }
                                    print(translateList);
                                  });
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  color: Colors.blue,
                                  child: translateList
                                          .contains(keyList[startIndex])
                                      ? Center(
                                          child: Text(shouldSeeMap[
                                              keyList[startIndex]]!))
                                      : Center(
                                          child: Text(keyList[startIndex]!)),
                                ),
                              )
                            ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widgetList.length - startIndex >= 4
                          ? [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (translateList
                                        .contains(keyList[startIndex+2])) {
                                      translateList.remove(keyList[startIndex+2]);
                                    } else {
                                      translateList.add(keyList[startIndex+2]);
                                    }
                                    print(translateList);
                                  });
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  color: Colors.blue,
                                  child: translateList
                                          .contains(keyList[startIndex+2])
                                      ? Center(
                                          child: Text(shouldSeeMap[
                                              keyList[startIndex+2]]!))
                                      : Center(
                                          child: Text(keyList[startIndex+2]!)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (translateList
                                        .contains(keyList[startIndex + 3])) {
                                      translateList
                                          .remove(keyList[startIndex + 3]);
                                    } else {
                                      translateList
                                          .add(keyList[startIndex + 3]);
                                    }
                                    print(translateList);
                                  });
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  color: Colors.blue,
                                  child: translateList
                                          .contains(keyList[startIndex + 3])
                                      ? Center(
                                          child: Text(shouldSeeMap[
                                              keyList[startIndex + 3]]!))
                                      : Center(
                                          child:
                                              Text(keyList[startIndex + 3]!)),
                                ),
                              )
                            ]
                          : widgetList.length - startIndex == 3 ? [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (translateList
                                        .contains(keyList[startIndex+2])) {
                                      translateList.remove(keyList[startIndex+2]);
                                    } else {
                                      translateList.add(keyList[startIndex+2]);
                                    }
                                    print(translateList);
                                  });
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  color: Colors.blue,
                                  child: translateList
                                          .contains(keyList[startIndex+2])
                                      ? Center(
                                          child: Text(shouldSeeMap[
                                              keyList[startIndex+2]]!))
                                      : Center(
                                          child: Text(keyList[startIndex+2]!)),
                                ),
                              )
                            ]:[]
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (startIndex >= 4) startIndex -= 4;
                        });
                      },
                      child: Icon(Icons.arrow_back)),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (widgetList.length - startIndex > 3)
                            startIndex += 4;
                        });
                      },
                      child: Icon(Icons.arrow_forward))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
