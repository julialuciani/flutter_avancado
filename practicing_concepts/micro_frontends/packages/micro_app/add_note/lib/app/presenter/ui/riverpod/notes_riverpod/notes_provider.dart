import 'package:add_note/app/presenter/ui/riverpod/notes_riverpod/notes_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'notes_notifier.dart';

final notesProvider = StateNotifierProvider<NotesNotifier, List<NoteModel>>(
  (ref) => NotesNotifier(),
);