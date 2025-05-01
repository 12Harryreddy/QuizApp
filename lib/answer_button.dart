import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.onTap, required this.text});

  final void Function() onTap;
  final String text;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        foregroundColor: const Color(0xFFFBF5DD),
        backgroundColor: const Color(0x8016404D),
        textStyle: const TextStyle(fontSize: 20),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.sora(

        ),
      ),
    );
  }
}
