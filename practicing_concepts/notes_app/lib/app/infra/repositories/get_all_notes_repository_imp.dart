import 'package:notes_app/app/domain/entities/note_entity.dart';
import 'package:notes_app/app/domain/repositories/get_all_notes_repository.dart';
import 'package:notes_app/app/infra/datasources/get_all_notes_datasource.dart';

class GetAllNotesRepositoryImp implements IGetAllNotesRepositories{
  
  final IGetAllNotesDatasource _datasource;
  GetAllNotesRepositoryImp(this._datasource);

  @override
  List<NoteEntity> call() {
    return _datasource.call();
  }

}