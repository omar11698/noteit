import 'dart:ui';

import '../../../domain/entities/note_entity.dart';

class NoteModel extends Note {

  const NoteModel({
    required super.title,
    required super.body,
    required super.id,
    required super.dateTime,
    required super.color,
  });


  @override
  NoteModel copyWith({
    String? title,
    String? body,
    required int id,
    DateTime? dateTime,
    Color? color,
  }) {
    return NoteModel(
      title: title ?? this.title,
      body: body ?? this.body,
      id: id,
      dateTime: dateTime ?? this.dateTime,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'body': body,
    'id': id,
    'dateTime': dateTime.toIso8601String(),
    'color': color.value,
  };

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
    title: json['title'],
    body: json['body'],
    id: json['id'],
    dateTime: DateTime.parse(json['dateTime']),
    color: Color(json['color']),
  );




}