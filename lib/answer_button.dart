import 'package:flutter/material.dart';

class Answerbutton extends StatelessWidget {
  const Answerbutton(
      {super.key, required this.answerText, required this.onTap});

  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            backgroundColor: const Color.fromARGB(255, 51, 7, 112),
            foregroundColor: Colors.white),
        child: Text(
          answerText,
          textAlign: TextAlign.center,
        ));
  }
}
