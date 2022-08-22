import 'package:add_note/app/presenter/ui/riverpod/notes_riverpod/notes_model.dart';
import 'package:add_note/app/presenter/ui/riverpod/notes_riverpod/notes_provider.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class AddNotePage extends HookConsumerWidget {
  static const route = '/adding-idea';
  final controllerInspirateTitle = TextEditingController();
  final controllerInspirateDescription = TextEditingController();
  final FocusNode focusDescription = FocusNode();

  final newIdeaFormKey = GlobalKey<FormState>();

  AddNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        automaticallyImplyLeading: true,
        title: const Text(
          'Note.it',
          style: TextStyle(letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                'Whats on your mind?',
                style: TextStyle(letterSpacing: 3, color: Colors.grey.shade400, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Form(
                    key: newIdeaFormKey,
                    child: Column(
                      children: [
                        TextFieldApp(
                          nextFocus: focusDescription,
                          hintText: 'Write...',
                          labelText: 'note',
                          controller: controllerInspirateTitle,
                          textfieldKey: 'noteTitle',
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        TextFieldApp(
                          nowFocus: focusDescription,
                          hintText: 'Go on...',
                          labelText: 'description',
                          controller: controllerInspirateDescription,
                          textfieldKey: 'noteDescription',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text('Your notes', style: TextStyle(letterSpacing: 3, color: Colors.grey.shade400, fontSize: 25)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                ],
              ),
            ),
            SizedBox(
              height: double.maxFinite,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        ref.read(notesProvider.notifier).changeNoteState(notes[index]);
                      },
                      child: ListTile(
                        leading: notes[index].isConcluded
                            ? Icon(
                                CupertinoIcons.checkmark_alt_circle_fill,
                                size: 28,
                                color: Colors.pink.shade200,
                              )
                            : Icon(
                                CupertinoIcons.xmark_circle,
                                size: 25,
                                color: Colors.pink.shade200,
                              ),
                        title: Text(notes[index].title),
                        subtitle: Text(notes[index].description),
                        shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.grey.shade400, width: 2)),
                        trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              ref.read(notesProvider.notifier).removeNote(notes[index]);
                            }),
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
        backgroundColor: Colors.pink.shade100,
        onPressed: () {
          if (newIdeaFormKey.currentState!.validate()) {
            ref.read(notesProvider.notifier).addNote(
                  NoteModel(
                    title: controllerInspirateTitle.text,
                    description: controllerInspirateDescription.text,
                  ),
                );
            controllerInspirateDescription.clear();
            controllerInspirateTitle.clear();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}