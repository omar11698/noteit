import 'dart:ui';

import 'package:equatable/equatable.dart';

class Note extends Equatable{

  final String title,body;
  final int id;
  final DateTime dateTime;
  final Color color;


  const Note({
    required this.title,
    required this.body,
    required this.id,
    required this.dateTime,
    required this.color,});



  @override
  List<Object?> get props => [title,body,id,dateTime,color,];

  Note copyWith({
    String? title,
    String? body,
    required int id,
    DateTime? dateTime,
    Color? color,
  }) {
    return Note(
      title: title ?? this.title,
      body: body ?? this.body,
      id: id,
      dateTime: dateTime ?? this.dateTime,
      color: color ?? this.color,
    );

  }

}