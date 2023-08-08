import 'package:flutter/material.dart';

class ExitButton extends StatefulWidget {
  final String title;
  const ExitButton({super.key,required this.title});

  @override
  State<ExitButton> createState() => _ExitButtonState();
}

class _ExitButtonState extends State<ExitButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.arrow_back_ios),
          Text('${widget.title}',),
          SizedBox(width: 10,)
        ],
      ),
      style: TextButton.styleFrom(
        fixedSize: Size(400,20),
      ),

      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
