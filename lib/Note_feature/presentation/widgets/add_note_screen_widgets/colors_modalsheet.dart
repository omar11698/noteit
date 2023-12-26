import 'package:flutter/material.dart';

import '../../../../core/utils/constants/utility/colors.dart';
import 'one_color_circle_avatar.dart';

class ColorsBottomModalSheet extends StatelessWidget {
  const ColorsBottomModalSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: MediaQuery.of(context).size.height/3,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),

        ),
        child: Center(
          child: GridView.count(
            crossAxisCount: 8,
            children: List.generate(kColorsOfNoteList.length, (index) {
              return OneColorCircleAvatar(backGroundColor:kColorsOfNoteList[index], );
            }),
          ),
        ),
      ),
    );
  }
}
