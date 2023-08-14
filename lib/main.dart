import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_app/constants/main_colors.dart';
import 'package:language_app/models/user_model.dart';
import 'package:language_app/screens/login.dart';
import 'package:language_app/screens/sign_up.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ProviderScope(child: MyApp()),
  );
}

final userModelProvider = StateProvider<userModel>((ref) =>
    userModel(
  '',
  '',
   0,
  [],
      "eng","eng",
)
);

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







class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final myUserModel2 = ref.watch(userModelProvider);


    return Scaffold(
      backgroundColor: MainColors.lightGray,
      appBar: AppBar(
        backgroundColor: MainColors.liveSecondaryColor,
        title: Text(title, style: TextStyle(color: Colors.white)),
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
                    backgroundColor: MainColors.lightGray,
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
                  backgroundColor: MainColors.lightGray,
                  textStyle: TextStyle(color: MainColors.secondaryColor,fontSize: 25)
              ),
            ),
            ElevatedButton(onPressed: (){}, child: Text("hey")),
          Text("${myUserModel2.name}"),
          // Text("${myUserModel2.name}"),
          ],
        ),
      ),
    );

    throw UnimplementedError();
  }
}


