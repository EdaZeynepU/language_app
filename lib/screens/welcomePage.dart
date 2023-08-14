
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_app/constants/main_colors.dart';
import 'package:language_app/screens/inside_category.dart';
import 'dart:math';
import '../firebase/auth.dart';
import '../main.dart';


class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  late Map<String, String> languageIconMap = {
  "Türkçe": "lib/icons/turkey_flag.png",
  "English": "lib/icons/america_flag.png",
  "Deutsch": "lib/icons/germany_flag.png",
  "Nederlands": "lib/icons/netherlands_flag.png",
  };
  String currentLang="eng";
  String currentTargetLang="eng";

  void _callbackLanguageSetter(String selectedLanguage, int firstOrSecond) {
    setState(() {
      final myUserModel = ref.watch(userModelProvider);
      if(firstOrSecond==0){
        currentLang=selectedLanguage;
        myUserModel.setLanguage(selectedLanguage);
      }else{
        currentTargetLang=selectedLanguage;
        myUserModel.setTargetLanguage(selectedLanguage);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final myUserModel = ref.watch(userModelProvider);
    setState(() {
      currentLang = myUserModel.getLanguage ?? "eng";
      currentTargetLang = myUserModel.getTargetLanguage ?? "eng";
    });
  }

  @override
  Widget build(BuildContext context) {
    final myUserModel = ref.watch(userModelProvider);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: MainColors.liveSecondaryColor,
          title: Text("Subjects",style: textStyle(Colors.white)),
          actions: [
            LanguageSettingsPopup(callbackLanguageSetter: _callbackLanguageSetter,firstOrSecond: 0),
            LanguageSettingsPopup(callbackLanguageSetter: _callbackLanguageSetter,firstOrSecond: 1),
            Container(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Image.asset("lib/icons/coin.png"),
                    Text("${myUserModel.getPoints}",style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            )
          ],
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
                        Text("- welcome -",style: TextStyle(fontSize: 25,color: Colors.white,),),
                        Text(" ${myUserModel.getName}",style: TextStyle(fontSize: 30,color: Colors.white),),
                        Text("Completed levels:${myUserModel.getCompletedLevels.length}",style: TextStyle(color: Colors.white,),)
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
                    title: Text('favorites'),
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
                    // tileColor: Color(0xFFB0DBE3),
                    tileColor: MainColors.accentColor,
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
              Hero(
                tag: 'Logout',
                child: Material(
                  child: ListTile(
                    title: const Text('Log out'),
                    tileColor:MainColors.lightAccentColor,
                    onTap: () {
                      AuthService().Logout(context);
                    },
                  ),
                ),
              ),
              //For Testing Color Palate
              Hero(
                tag: 'Settings2',
                child: Material(
                  child: ListTile(
                    title: const Text('Settings'),
                    // tileColor: Color(0xFFB0DBE3),
                    tileColor: MainColors.fourthColor,
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
              Hero(
                tag: 'Logout2',
                child: Material(
                  child: ListTile(
                    title: const Text('Log out'),
                    tileColor:MainColors.lightFourthColor,
                    onTap: () {
                      AuthService().Logout(context);
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => InsideCategory(category: "Basics 1",language: currentLang,targetLanguage: currentTargetLang),));
                      }, child: Text("Basics 1",style: textStyle(Colors.white),textAlign:TextAlign.center),style: buttonStyle(MainColors.lightPrimaryColor)),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => InsideCategory(category: "Greetings",language: currentLang,targetLanguage: currentTargetLang),));
                      }, child: Text("Greetings ",style: textStyle(Colors.white),textAlign:TextAlign.center),style: buttonStyle(MainColors.primaryColor),),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  InsideCategory(category: "Family 1",language: currentLang,targetLanguage: currentTargetLang),));
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
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  InsideCategory(category: "Food",language: currentLang,targetLanguage: currentTargetLang),));
                      }, child: Text("Food",style: textStyle(Colors.white),textAlign:TextAlign.center), style: buttonStyle(MainColors.darkPrimaryColor),),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  InsideCategory(category: "Numbers 1",language: currentLang,targetLanguage: currentTargetLang),));
                      }, child: Text("Numbers 1",style: textStyle(Colors.white),textAlign:TextAlign.center),style: buttonStyle(MainColors.primaryColor),),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  InsideCategory(category: "Family 2",language: currentLang,targetLanguage: currentTargetLang),));
                      }, child: Text("Family 2",style: textStyle(Colors.white),textAlign:TextAlign.center),style: buttonStyle(MainColors.lightPrimaryColor),),
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
              tileColor: Colors.white,
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

class LanguageSettingsPopup extends StatefulWidget {
  final Function callbackLanguageSetter;
  final int firstOrSecond;

  LanguageSettingsPopup({required this.callbackLanguageSetter,required this.firstOrSecond});

  @override
  _LanguageSettingsPopupState createState() => _LanguageSettingsPopupState();
}

class _LanguageSettingsPopupState extends State<LanguageSettingsPopup> {
  Map<String, String> languageMap = {
    "Türkçe": "tr",
    "English": "eng",
    "Deutsch": "de",
    "Nederlands": "nl",
  };

  late Map<String, String> languageIconMap = {
    "Türkçe": "lib/icons/turkey_flag.png",
    "English": "lib/icons/america_flag.png",
    "Deutsch": "lib/icons/germany_flag.png",
    "Nederlands": "lib/icons/netherlands_flag.png",
  };

  String selectedOption = "English";

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Row(
        children: [
          // const Icon(Icons.language,color: Colors.white),
          Image.asset(languageIconMap[selectedOption]!),
          SizedBox(width: 5,),
          Text("${languageMap[selectedOption]}",style: TextStyle(color: Colors.white),)
        ],
      ),
      color: Colors.grey,
      onPressed: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  title: widget.firstOrSecond==0 ? Text('What is your native language ?'):Text("What is your target language?") ,
                  content: DropdownButton<String>(
                    value: selectedOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue!;
                      });
                    },
                    items: languageMap.keys
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                        .toList(),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'same'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pop(context, languageMap[selectedOption]),
                      child: const Text('Ok'),
                    ),
                  ],
                );
              },
            );
          },
        ).then((value) {
          if (value != "same") {
            widget.callbackLanguageSetter(value,widget.firstOrSecond);
          }
        });
      },
    );
  }
}

