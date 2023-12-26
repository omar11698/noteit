import 'package:flutter/material.dart';
import 'package:noteit/Note_feature/presentation/manager/providers/color_showmodal_provider.dart';
import 'package:noteit/Note_feature/presentation/widgets/add_note_screen_widgets/add_note_screen_widgets.dart';
import 'package:noteit/core/utils/extensions/extensions.dart';
import 'package:provider/provider.dart';

class OneColorCircleAvatar extends StatelessWidget {
  final Color backGroundColor;

   OneColorCircleAvatar({
    super.key, required this.backGroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<ShowColorBottomModalProvider>(
      builder: (BuildContext context, value, Widget? child) {

        return GestureDetector(
          onTap: (){

            Provider.of<ShowColorBottomModalProvider>(context,listen: false).changeTheBackGroundColor(bgColor: backGroundColor);
            // context.pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35,
              width: 35,
              decoration:BoxDecoration(
                border: backGroundColor==value.colorSelected?Border.all(color: Colors.red):Border.all(color: backGroundColor),
                color: backGroundColor??Colors.white,
                shape: BoxShape.circle,
              ),
              child:backGroundColor==value.colorSelected? const Icon(Icons.check):Container(),
            ),
          ),
        ) ;
      },
    );
  }
}
