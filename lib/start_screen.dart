import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchState, {super.key});

  final void Function() switchState;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/logo.png',
            color: Color(0x90FBF5DD),
            width: 310,
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            "Learn Flutter the Fun Way!",
            style: GoogleFonts.robotoSerif(
              color: Color(0xFFFBF5DD),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: switchState,
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFFBF5DD),
              textStyle: TextStyle(fontSize: 28),
            ),
            icon: const Icon(
              Icons.arrow_right_alt_rounded,
              color: Color(0xFFFBF5DD),
              size: 35,
            ),
            label: Text(
              "Start Quiz",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
