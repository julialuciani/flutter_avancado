
import '../entities/note_entity.dart';

abstract class IGetAllNotesUsecase{
  List<NoteEntity> call();
}