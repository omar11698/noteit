import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../manager/providers/font_icon_provider.dart';

class FontAvatar extends StatelessWidget {
  const FontAvatar({
    super.key,
    required this.selectedNoteColor,
    required this.textColor, required this.isToolBoxVisible,
  });

  final Color selectedNoteColor;
  final Color textColor;
  final bool isToolBoxVisible;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint("$isToolBoxVisible");
        Provider.of<FontButtonProvider>(context,
            listen: false)
            .toggleToolBox();
      },
      child: Container(
        decoration: BoxDecoration(
            color: selectedNoteColor,
            border: Border.all(
                color: textColor.withOpacity(0.6),
                width: 2
            ),
            borderRadius: BorderRadius.circular(50)
        ),
        padding: const EdgeInsets.all(3),
        child: Icon(
          Icons.font_download_rounded,
          color: textColor.withOpacity(0.6),
        ),
      ),
    );
  }
}
