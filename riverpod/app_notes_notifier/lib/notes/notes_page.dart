import 'package:app_notes_notifier/notes/note_model.dart';
import 'package:app_notes_notifier/notes/notes_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class NotesPage extends HookConsumerWidget {
  final noteController = TextEditingController();

  NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Notes',
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 4,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: noteController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(55),
                ),
                hintText: 'Write something...',
                labelText: 'Note',
                labelStyle: const TextStyle(letterSpacing: 3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                'Your notes',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey.shade600,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      ref
                          .read(notesProvider.notifier)
                          .changeNoteState(notes[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 3),
                      child: ListTile(
                        leading: notes[index].isConcluded
                            ? const Icon(
                                CupertinoIcons.checkmark_alt_circle_fill,
                                size: 28,
                                color: Colors.indigo,
                              )
                            : const Icon(
                                CupertinoIcons.xmark_circle,
                                size: 28,
                                color: Colors.indigo,
                              ),
                        title: Text(notes[index].title),
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            ref
                                .read(notesProvider.notifier)
                                .removeNote(notes[index]);
                          },
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(55),
                            side: const BorderSide(
                                width: 2, color: Colors.indigo)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(notesProvider.notifier).addNote(
                NoteModel(title: noteController.text),
              );
          noteController.clear();
        },
        child: const Icon(
          Icons.done_all,
          size: 35,
        ),
      ),
    );
  }
}
