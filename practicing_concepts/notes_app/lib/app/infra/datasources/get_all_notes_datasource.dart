import 'package:notes_app/app/domain/entities/note_entity.dart';

abstract class IGetAllNotesDatasource{
  List<NoteEntity> call();
}