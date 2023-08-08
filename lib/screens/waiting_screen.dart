import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_app/models/user_model.dart';



class WaitingScreen extends ConsumerWidget {
  WaitingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
