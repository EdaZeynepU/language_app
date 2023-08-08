import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_app/constants/main_colors.dart';
import 'package:language_app/screens/inside_category.dart';
import 'dart:math';
import '../main.dart';


class welcomePage extends ConsumerWidget {
  welcomePage({Key? key}) :
        super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    {
    final myUserModel = ref.watch(userModelProvider);

      return Scaffold(
        appBar: AppBar(
          backgroundColor: MainColors.liveSecondaryColor,
          title: Text("Subjects",style: textStyle(Colors.white)),
        ),
        drawer: Drawer(
          backgroundColor: MainColors.lightGray,
          child: ListView(
            padding: EdgeInsets.all(5),
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    color: MainColors.primaryColor,
                    gradient: LinearGradient(transform: GradientRotation((pi/4)*2),colors: [MainColors.primaryColor,MainColors.lightPrimaryColor])
                ),
                child : Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text("- welcome -",style: TextStyle(fontSize: 25,color: MainColors.gray,),),
                        Text(" ${myUserModel.getName}",style: TextStyle(fontSize: 30,color: MainColors.gray,),),
                        Text("Completed levels:${myUserModel.getCompletedLevels.length}",style: TextStyle(color: MainColors.gray,),)
                      ],
                    )),
              ),
              Hero(
                tag: 'levels',
                child: Material(
                  child: ListTile(
                    title: const Text('levels'),
                    tileColor: MainColors.lightPrimaryColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(builder: (BuildContext context) {
                          return SettingsPage();//for now
                        }),
                      );
                    },
                  ),
                ),
              ),
              Hero(
                tag: 'favorites',
                child: Material(
                  child: ListTile(
                    title: const Text('favorites'),
                    tileColor: MainColors.secondaryColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(builder: (BuildContext context) {
                          return SettingsPage();//for now
                        }),
                      );
                    },
                  ),
                ),
              ),
              Hero(
                tag: 'Settings',
                child: Material(
                  child: ListTile(
                    title: const Text('Settings'),
                    tileColor: MainColors.gray,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(builder: (BuildContext context) {
                          return SettingsPage();
                        }),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: MainColors.lightGray,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Flex(
                    direction: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => InsideCategory(category: "Basics 1"),));
                      }, child: Text("Basics 1",style: textStyle(Colors.white),textAlign:TextAlign.center),style: buttonStyle(MainColors.lightPrimaryColor)),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => InsideCategory(category: "Greetings",),));
                      }, child: Text("Greetings ",style: textStyle(Colors.white),textAlign:TextAlign.center),style: buttonStyle(MainColors.primaryColor),),
                      ElevatedButton(onPressed: (){
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ,));
                      }, child: Text("Family 1",style: textStyle(Colors.white),textAlign:TextAlign.center),style: buttonStyle(MainColors.darkPrimaryColor)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){}, child: Text("Food",style: textStyle(Colors.white),textAlign:TextAlign.center), style: buttonStyle(MainColors.darkPrimaryColor),),
                      ElevatedButton(onPressed: (){}, child: Text("Numbers 2",style: textStyle(Colors.white),textAlign:TextAlign.center),style: buttonStyle(MainColors.primaryColor),),
                      ElevatedButton(onPressed: (){}, child: Text("Family 2",style: textStyle(Colors.white),textAlign:TextAlign.center),style: buttonStyle(MainColors.lightPrimaryColor),),
                    ],

                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){}, child: Text("Basics 2",style: textStyle(Colors.white),textAlign:TextAlign.center),style: buttonStyle(MainColors.lightAccentColor)),
                      ElevatedButton(onPressed: (){}, child: Text("Colors",style: textStyle(Colors.white),textAlign:TextAlign.center),style: buttonStyle(MainColors.accentColor)),
                      ElevatedButton(onPressed: (){}, child: Text("Numbers 1",style: textStyle(Colors.white),textAlign:TextAlign.center),style: buttonStyle(MainColors.darkAccentColor)),
                    ],

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){}, child: Text("Time 1",style: textStyle(Colors.white),textAlign:TextAlign.center), style: buttonStyle(MainColors.darkAccentColor),),
                      ElevatedButton(onPressed: (){}, child: Text("Time 2",style: textStyle(Colors.white),textAlign:TextAlign.center), style: buttonStyle(MainColors.accentColor),),
                      ElevatedButton(onPressed: (){}, child: Text("Weather",style: textStyle(Colors.white),textAlign:TextAlign.center), style: buttonStyle(MainColors.lightAccentColor),),
                    ],

                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){}, child: Text("Basics 2",style: textStyle(Colors.white),textAlign:TextAlign.center),style: buttonStyle(MainColors.lightFourthColor)),
                      ElevatedButton(onPressed: (){}, child: Text("Colors",style: textStyle(Colors.white),textAlign:TextAlign.center),style: buttonStyle(MainColors.fourthColor)),
                      ElevatedButton(onPressed: (){}, child: Text("Numbers 1",style: textStyle(Colors.white),textAlign:TextAlign.center),style: buttonStyle(MainColors.darkFourthColor)),
                    ],

                  ),
                ),

              ],
            ),
          ),
        ),
      );
    }
    throw UnimplementedError();
  }
}

TextStyle textStyle(Color clr) =>  TextStyle(color: clr,fontSize: 16);

ButtonStyle buttonStyle(Color bg) {
  return TextButton.styleFrom(
      backgroundColor: bg, fixedSize: Size(120, 120));
}
class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Hero(
          tag: 'settings',
          child: Material(
            child: ListTile(
              title: const Text("lets go back"),
              subtitle: const Text('Tap here to go back'),
              tileColor: MainColors.secondaryColor,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
