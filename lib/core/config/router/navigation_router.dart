
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteit/Note_feature/domain/entities/note_entity.dart';

import '../../../Note_feature/presentation/pages/add_note_screen.dart';
import '../../../Note_feature/presentation/pages/home_screen.dart';
import '../../../main.dart';
import '../dependency_injection/DI.dart';

const String homeRoute='/';
const String addNoteRoute='/addNoteRoute';


class NavigationRouter{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case homeRoute:
        initNoteModule();
        return MaterialPageRoute(builder: (_) => const MyHomeScreen());

      case addNoteRoute:
        return MaterialPageRoute(builder: (_) =>  AddNoteScreen(note: Note(title: '', body: '', id: Random().nextInt(100), dateTime: DateTime.now(), color: Colors.white),));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}