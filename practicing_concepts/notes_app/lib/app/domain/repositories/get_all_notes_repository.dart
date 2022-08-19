import '../entities/note_entity.dart';

abstract class IGetAllNotesRepositories{
  List<NoteEntity> call();
}