import 'package:flutter/material.dart';

class ColorfulCircleAvatar extends StatelessWidget {
  final List<Color> listOfColors;

  const ColorfulCircleAvatar({
    super.key, required this.listOfColors,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 35,
        width: 35,
        decoration:  BoxDecoration(

            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: listOfColors

            ),
            shape: BoxShape.circle
        ),
      ),
    );
  }
}
