import 'package:notes_app/app/domain/entities/note_entity.dart';

import '../get_all_notes_datasource.dart';

class GetAllNotesLocalDatasourceImp implements IGetAllNotesDatasource{
  @override
  List<NoteEntity> call() {
    return [
      NoteEntity(id: 0, title: 'New,', description: 'Time to think', isConcluded: false)
    ];
  }

}