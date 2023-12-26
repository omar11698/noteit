import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/extensions/extensions.dart';



class FontButtonProvider extends ChangeNotifier {
  int selectedFontIconIndex = 0;
  bool isToolBoxVisible;
  MyGoogleFonts selectedFont;

  FontButtonProvider( {
    required this.isToolBoxVisible,required this.selectedFont,
  });

  toggleToolBox() {
    isToolBoxVisible = !isToolBoxVisible;
    notifyListeners();
  }

  changeFontToSelected(MyGoogleFonts googleFonts){
      selectedFont=googleFonts;
      notifyListeners();
  }

  borderSelectedFont(int index){
    selectedFontIconIndex = index;
    notifyListeners();
  }


}
