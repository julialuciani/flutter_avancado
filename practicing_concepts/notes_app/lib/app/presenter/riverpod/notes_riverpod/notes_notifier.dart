import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../ui/note_model.dart';

class NotesNotifier extends StateNotifier<List<NoteModel>>{
  NotesNotifier() : super([]);

  void addNote(NoteModel note){
    if (note.title.isNotEmpty && note.description.isNotEmpty){
      state = [...state, note];
    }
  }

  void removeNote(NoteModel note){
    state = state.where((noteOfList) => noteOfList != note).toList();
  }
  
  void changeNoteState(NoteModel note){
    NoteModel newNote = NoteModel(
      title: note.title,
      description: note.description,
      isConcluded: !note.isConcluded,
    );
    state = state.where((noteOfList) => noteOfList != note).toList();

    state = [newNote, ...state];
  }
}