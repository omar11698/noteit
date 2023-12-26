import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/extensions/extensions.dart';
import '../../manager/providers/font_icon_provider.dart';

class FontFamilyIcon extends StatelessWidget {
  final int index;
  final bool isSelected;
  const FontFamilyIcon({
    super.key,
    required this.textColor,
    required this.h,
    required this.index,
    required this.isSelected,
  });

  final Color textColor;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      // final fontProvider = watch(fontProvider);
      // return GestureDetector(
      //   onTap: () {
      //     fontProvider.selectedFontIconIndex = index;
      //     fontProvider.changeFontToSelected(fontProvider.fonts[index]);
      //   },
      //   child: Container(
      //     height: h,
      //     width: h,
      //     decoration: BoxDecoration(
      //         color: isSelected ? Colors.blue : Colors.transparent,
      //         borderRadius: BorderRadius.circular(h / 2)
      //     ),
      //     child: Padding(
      //       padding: const EdgeInsets.all(5),
      //       child: Icon(
      //         fontProvider.fonts[index].fontFamily,
      //         color: textColor,
      //         size: h * 0.7,
      //       ),
      //     ),
      //   ),
      // );
      final fontProvider = context.read<FontButtonProvider>();
      return GestureDetector(
        onTap: () {
          switch (index) {
            case 0:
              Provider.of<FontButtonProvider>(context, listen: false)
                  .changeFontToSelected(MyGoogleFonts.abyssinicaSil);
              break;
            case 1:
              Provider.of<FontButtonProvider>(context, listen: false)
                  .changeFontToSelected(MyGoogleFonts.acme);

              break;
            case 2:
              Provider.of<FontButtonProvider>(context, listen: false)
                  .changeFontToSelected(MyGoogleFonts.abel);

              break;
            default:
          }
          fontProvider.borderSelectedFont(index);
        },
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: h * 0.03),
          child: Container(
            height: h * 0.05,
            width: h * 0.05,
                  decoration: BoxDecoration(
                      color: isSelected ? Colors.blueGrey : Colors.transparent,

                    ),
            child: Icon(
              Icons.font_download,
              color: textColor,
              size: h * 0.05,
            ),
          ),
        ),
      );
    });
  }
}
