import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoText extends StatelessWidget {
  final double fontSize;
  const LogoText({super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      "NoteIt",
      style: TextStyle(
          fontSize: fontSize,
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontFamily: GoogleFonts.acme().fontFamily),
    );
  }
}
