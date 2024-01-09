import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteit/Auth_feature/presentation/pages/login_screen.dart';
import 'package:noteit/Note_feature/domain/entities/note_entity.dart';
import 'package:noteit/Auth_feature/presentation/pages/register_screen.dart';

import '../../../Note_feature/presentation/pages/add_note_screen.dart';
import '../../../Note_feature/presentation/pages/home_screen.dart';
import '../dependency_injection/DI.dart';

const String homeRoute = '/';
const String addNoteRoute = '/addNoteRoute';
const String registerRouter = '/registerRoute';
const String loginRoute = '/loginRoute';

class NavigationRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        initNoteModule();
        return MaterialPageRoute(builder: (_) => const MyHomeScreen());

      case addNoteRoute:
        return MaterialPageRoute(
            builder: (_) => AddNoteScreen(
                  note: Note(
                      title: '',
                      body: '',
                      id: Random().nextInt(100),
                      dateTime: DateTime.now(),
                      color: Colors.white),
                  isEditing: false,
                ));

      case registerRouter:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
