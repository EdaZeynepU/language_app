import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_app/constants/main_colors.dart';
import 'package:language_app/firebase/auth.dart';
import 'package:language_app/screens/welcomePage.dart';
import 'package:language_app/models/user_model.dart';

import '../main.dart';

class loginPage extends ConsumerWidget {
  final String title;
  const loginPage({Key? key, required this.title}) : super(key: key);


      @override
      Widget build(BuildContext context,WidgetRef ref) {
        TextEditingController _userNameController = TextEditingController();
        TextEditingController _userPasswordController = TextEditingController();
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
                const Text(
                  'Email:',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
                  child: TextField(
                    controller: _userNameController,
                  ),
                ),
                const Text(
                  'Password:',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
                  child: TextField(
                    obscureText: true,
                    controller: _userPasswordController,
                  ),
                ),
                ElevatedButton(onPressed: () async {
                  // print(_userNameController.text);
                  AuthService().signIn(
                      _userNameController.text, _userPasswordController.text);

                  // var model= await createModel();

                  updateUserDetails(ref);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => welcomePage(),));

                  // loginCheck(
                  //     _userNameController.text, _userPasswordController.text);
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
                ),
              ],
            ),
          ),
        );

        throw UnimplementedError();
      }


  void updateUserDetails(WidgetRef ref) async {
    // You can access the userProvider's ref using the ProviderContainer
    final container = ProviderContainer(); // Create a ProviderContainer instance
    // final userModel = container.read(userModelProvider); // Read the current state


    var model= await createModel();

    ref.watch(userModelProvider.notifier).state= model;
  }
}
