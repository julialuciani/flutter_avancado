import 'dart:convert';

import 'package:notes_app/app/domain/entities/note_entity.dart';

class NoteDto extends NoteEntity {
  @override
  int id;
  @override
  String title;
  @override
  String description;
  @override
  bool isConcluded;

  NoteDto({
    required this.id,
    required this.title,
    required this.description,
    required this.isConcluded,
  }) : super(
          id: id,
          title: title,
          description: description,
          isConcluded: isConcluded,
        );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'isConcluded': isConcluded});

    return result;
  }

  factory NoteDto.fromMap(Map<String, dynamic> map) {
    return NoteDto(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isConcluded: map['isConcluded'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteDto.fromJson(String source) => NoteDto.fromMap(json.decode(source));
}
