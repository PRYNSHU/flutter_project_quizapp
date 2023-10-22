import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.text, this.onTap, {super.key});

  final String text;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(4),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 27, 10, 98),
        // shape: RoundedRectangleBorder(borderRadius: )
      ),
      onPressed: onTap,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
