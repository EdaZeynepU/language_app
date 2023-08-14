import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_app/models/user_model.dart';
import '../main.dart';

class GameComplete extends ConsumerWidget {
  const GameComplete({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUserModel = ref.watch(userModelProvider);
    myUserModel.addPoints(5);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Center(child: Column(
        children: [
          Text("Congrats you won!"),
          Text("You have ${myUserModel.getPoints} points now 🥳"),
        ],
      ),)),
    );
    throw UnimplementedError();
  }

}
