import 'package:flutter/material.dart';
import 'package:language_app/constants/main_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signUp extends StatefulWidget {
  final String title;
  const signUp({Key? key, required this.title}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();


  void setNewUser(userName, password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList(userName) == null) {
      String _password = "password:" + password;
      prefs.setStringList(userName, [_password]);
      prefs.setString("currentUser", userName);
    } else {
      throw new FormatException("zaten varrr");
    }
    // print(prefs.getStringList(userName)!.where((x) => x.contains("password:")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.lightAccentColor,
      appBar: AppBar(
        backgroundColor: MainColors.liveSecondaryColor,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: Center(


        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'What is your name:',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                controller: _userNameController,
              ),
            ),
            const Text(
              'Password:',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                obscureText:true,
                controller: _userPasswordController,
              ),
            ),
            ElevatedButton(onPressed: () {
              print(_userNameController.text);
              setNewUser(
                  _userNameController.text, _userPasswordController.text);
            },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Create local game",),
                  SizedBox(width: 8,),
                  Icon(Icons.arrow_forward,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}