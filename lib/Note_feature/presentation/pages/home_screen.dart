import 'package:flutter/material.dart';
import 'package:noteit/core/utils/extensions/extensions.dart';
import '../widgets/home_screen_widgets/home_screen_widgets.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    var h=context.deviceHeight();

    return Scaffold(

      /// hello app bar

        appBar:   PreferredSize(
        preferredSize:  Size.fromHeight(h*0.07),
        child: const HelloAppBar(),),

      /// Notes from firebase

      body: const Center(child: DynamicGrid(),),

      /// add note floating action button

      floatingActionButton: const AddNoteFloatingActionButton(),
    );
  }
}






