import 'package:flutter/material.dart';
import 'package:language_app/constants/main_colors.dart';
import 'package:language_app/screens/login.dart';
import 'package:language_app/screens/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: MainColors.primaryColor,
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Language Learning'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();

  void setNewUser(userName, password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList(userName) == null) {
      String _password = "password:" + password;
      prefs.setStringList(userName, [_password]);
    } else {
      throw new FormatException("zaten varrr");
    }
    print(prefs.getStringList(userName)!.where((x) => x.contains("password:")));
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("Welcome!",style: TextStyle(color: MainColors.darkPrimaryColor,fontSize: 40)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => signUp(title: "Sign Up")));
                  },
                  child: Text("Sign Up"),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 80),
                  backgroundColor: MainColors.lightAccentColor,
                  textStyle: TextStyle(color: MainColors.secondaryColor,fontSize: 25)
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => loginPage(title: "Login")));
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 80),
                  backgroundColor: MainColors.lightAccentColor,
                  textStyle: TextStyle(color: MainColors.secondaryColor,fontSize: 25)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
