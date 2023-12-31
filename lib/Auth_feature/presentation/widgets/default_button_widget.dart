import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const DefaultButton({
    super.key,
    required this.mobileSize,
    required this.label,
    required this.onTap,
  });

  final Size mobileSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: mobileSize.height * 0.068,
        width: mobileSize.width * 0.94,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Colors.orangeAccent, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          border: Border.all(
            width: 0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
              fontFamily: GoogleFonts.acme().fontFamily),
        ),
      ),
    );
  }
}
