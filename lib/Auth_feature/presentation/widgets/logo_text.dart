import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  final double fontSize;
  const LogoText({super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      "NoteIt",
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
