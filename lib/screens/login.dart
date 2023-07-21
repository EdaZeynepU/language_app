import 'package:flutter/material.dart';
import 'package:language_app/constants/main_colors.dart';
import 'package:language_app/screens/welcomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:language_app/models/user_model.dart';

class loginPage extends StatefulWidget {
  final String title;
  const loginPage({Key? key, required this.title}) : super(key: key);


  @override
  State<loginPage> createState() => _loginPageState();
}



class _loginPageState extends State<loginPage> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();

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
              padding: const EdgeInsets.only(left: 50, right: 50,bottom: 30),
              child: TextField(
                controller: _userNameController,
              ),
            ),
            const Text(
              'Password:',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50,bottom: 30),
              child: TextField(
                obscureText:true,
                controller: _userPasswordController,
              ),
            ),
            ElevatedButton(onPressed: () {
              print(_userNameController.text);
              loginCheck(
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

  void loginCheck(String userName, String userPassword) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? dataUser=prefs.getStringList(userName);
    if(dataUser==null){
      throw new FormatException("böyle biri yokk");
    }else{
      String dataPassword= dataUser!.where((x) => x.contains("password:")).toString();
      userPassword="(password:"+userPassword+")";
      print(dataPassword+" "+userPassword);
      if(userPassword==dataPassword){
        prefs.setString("currentUser", userName);
        print(dataPassword);

        var user = userModel(userName);
        await createModel(user);
        Navigator.push(context,MaterialPageRoute(builder: (context) => welcomePage(user:user),));
      }
      else{
        throw new FormatException("yanlış şifre");
      }
    }
  }
}
