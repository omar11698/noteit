import 'package:flutter/material.dart';

List<Color> accentColors=Colors.accents;
List<Color> primaryColors=Colors.primaries;
List<Color>kColorsOfNoteList= List.from(primaryColors)..addAll(accentColors);



// [Colors.red,Colors.blue,Colors.yellow,Colors.cyan,Colors.green,Colors.grey,Colors.orange,Colors.pink,Colors.indigoAccent,
//   Colors.greenAccent,Colors.teal,Colors.limeAccent,Colors.cyan,Colors.green,Colors.grey,Colors.orange,Colors.pink,Colors.indigoAccent,];

class MyColors{

  static primaryWhiteThemeColor (BuildContext context )=> Theme.of(context).colorScheme.inversePrimary;
  static primaryTextBasedOnBgColor(Color color)=>  color.computeLuminance()>0.5? Colors.black:Colors.white;
}
