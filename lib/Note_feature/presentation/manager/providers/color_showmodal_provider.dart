import 'package:flutter/cupertino.dart';

class ShowColorBottomModalProvider extends ChangeNotifier{

  Color colorSelected;
  ShowColorBottomModalProvider({required this.colorSelected});

  changeTheBackGroundColor({required Color bgColor}){
    colorSelected=bgColor;
    notifyListeners();
  }




}