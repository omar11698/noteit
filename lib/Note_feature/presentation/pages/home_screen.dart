import 'package:flutter/material.dart';
import 'package:noteit/core/config/themes/theme_provider.dart';
import 'package:noteit/core/utils/extensions/extensions.dart';
import 'package:provider/provider.dart';
import '../../../core/config/themes/app_themes.dart';
import '../../../core/utils/constants/images/images_path.dart';
import '../widgets/home_screen_widgets/home_screen_widgets.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var h=context.deviceHeight();
    return Consumer<ThemeProvider>(
      builder: (context,themeProvider,child){
        /// choose the color depending on the theme
        var  themeColor= themeProvider.isThemeChanged? AppTheme.dark: AppTheme.light;
        return Scaffold(

          /// hello app bar

          appBar:   PreferredSize(
            preferredSize:  Size.fromHeight(h*0.07),
            child:  HelloAppBar(themeColor: themeColor),),
          drawer: MyDrawer(themeColor: themeColor),


          /// Notes from firebase

          body: const Center(child: DynamicGrid(),),

          /// add note floating action button

          floatingActionButton: const AddNoteFloatingActionButton(),
        );
      }
    );
  }
}







