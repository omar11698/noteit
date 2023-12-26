import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/themes/theme_provider.dart';

class HelloAppBar extends StatelessWidget {

  const HelloAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: MyColors.primaryWhiteThemeColor(context),
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      centerTitle: true,
      toolbarHeight: 60,
      title: const Text(
        'HELLO',
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Container()),
      actions: [

    Consumer<ThemeProvider>(
    builder: (BuildContext context, value, Widget? child) {
      bool switchValue = value.isThemeChanged;
      return Builder(
          builder: (context) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 150),
                  //   child: LiteRollingSwitch(
                  //       value: switchValue,
                  //       colorOn: Colors.deepOrange,
                  //       colorOff: Colors.blueGrey,
                  //       textOn: 'dark',
                  //       textOff: 'light',
                  //       iconOff: Icons.sunny,
                  //       iconOn: Icons.dark_mode_outlined,
                  //       animationDuration: const Duration(milliseconds: 300),
                  //       onTap: (){},
                  //       onDoubleTap: (){},
                  //       onSwipe: (){},
                  //       onChanged: (value) {
                  //         Provider.of<ThemeProvider>(context, listen: false)
                  //             .changeTheme();
                  //       }),
                  // ),
                  child: Switch(value: switchValue, onChanged: (bool value) {
                    Provider.of<ThemeProvider>(context,listen: false).changeTheme();
                  },
                    activeColor: Colors.white,
                    inactiveThumbImage: const NetworkImage('https://img.freepik.com/free-vector/yellow-crescent-geometric-shape-vector_53876-164618.jpg'),
                    activeThumbImage:  const NetworkImage('https://t4.ftcdn.net/jpg/01/66/86/29/360_F_166862953_6Vy6pir6kahx4x6B5c9saPbwQ6yqNAnK.jpg',),
                  ),)
            );
          }
      );
    },

        ),
      ],
    );
  }

}
