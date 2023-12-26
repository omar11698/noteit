import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Note_feature/presentation/manager/providers/font_icon_provider.dart';

extension Router on BuildContext{

  goTo(String screen){
     Navigator.pushNamed(this, screen);
  }
  pop(){
    Navigator.pop(this);
  }

}
extension DeviceSize on BuildContext{

  double deviceHeight(){
    return MediaQuery.of(this).size.height;
  }

  double deviceWidth(){
   return MediaQuery.of(this).size.width;

  }

}
extension ProviderEx on BuildContext{

     access(FontButtonProvider t){

      return Provider.of<FontButtonProvider>(this,listen:false);
     }

}









enum MyGoogleFonts {
  acme,
  abel,
  abyssinicaSil,
}
extension ExGoogleFonts on MyGoogleFonts {

  getFontTitlePropertise(Color txtColor){

    switch(this) {

      case MyGoogleFonts.acme:
        return GoogleFonts.acme(
            fontSize: 24, fontWeight: FontWeight.bold,textStyle: TextStyle(color: txtColor) );

      case MyGoogleFonts.abel:

        return GoogleFonts.abel(
            fontSize: 24, fontWeight: FontWeight.bold,textStyle: TextStyle(color: txtColor) );
      case MyGoogleFonts.abyssinicaSil:

        return GoogleFonts.abyssinicaSil(
            fontSize: 24, fontWeight: FontWeight.bold,textStyle: TextStyle(color: txtColor) );

      default:
    }

  }
  getFontBodyPropertise(Color txtColor){

    switch(this) {

      case MyGoogleFonts.acme:
        return GoogleFonts.acme(
            fontSize: 20, fontWeight: FontWeight.w300,textStyle: TextStyle(color: txtColor) );

      case MyGoogleFonts.abel:

        return GoogleFonts.abel(
            fontSize: 20, fontWeight: FontWeight.w300,textStyle: TextStyle(color: txtColor) );
      case MyGoogleFonts.abyssinicaSil:

        return GoogleFonts.abyssinicaSil(
            fontSize: 20, fontWeight: FontWeight.w300,textStyle: TextStyle(color: txtColor) );

      default:
    }

  }


}