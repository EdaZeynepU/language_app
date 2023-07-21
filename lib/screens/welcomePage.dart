import 'package:flutter/material.dart';
import 'package:language_app/constants/main_colors.dart';
import 'package:language_app/models/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';


class welcomePage extends StatefulWidget {
  final userModel currentUser;

  welcomePage({Key? key, required userModel user}) :
        currentUser = user,
        super(key: key);

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainColors.liveSecondaryColor,
        title: Text("Subjects",style: TextStyle(color: Colors.white)),
      ),
      drawer: Drawer(

        backgroundColor: MainColors.lightAccentColor,
        child: ListView(
          padding: EdgeInsets.all(5),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: MainColors.primaryColor,
                gradient: LinearGradient(transform: GradientRotation((pi/4)*2),colors: [MainColors.darkPrimaryColor,MainColors.primaryColor])
              ),
              child : Align(
                alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text("- welcome -",style: TextStyle(fontSize: 25,color: MainColors.accentColor,),),
                      Text(" ${widget.currentUser.getName}",style: TextStyle(fontSize: 30,color: MainColors.accentColor,),),
                      Text("Completed levels:${widget.currentUser.getCompletedLevels.length}",style: TextStyle(color: MainColors.accentColor,),)
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
          ],
        ),
      ),
      backgroundColor: MainColors.lightAccentColor,
      body: Center(
        child: Column(
          children: [
            Text("${widget.currentUser.getName}"),

          ],
        ),
      ),
    );
  }
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
