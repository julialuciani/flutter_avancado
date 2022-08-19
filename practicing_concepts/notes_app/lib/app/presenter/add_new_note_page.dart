import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/app/presenter/note_model.dart';
import 'package:notes_app/app/presenter/riverpod/notes_riverpod/notes_provider.dart';

import '../../shared/widgets/textfield_app.dart';

class AddNewIdeaPage extends HookConsumerWidget {
  static const route = '/adding-idea';
  final controllerInspirateTitle = TextEditingController();
  final controllerInspirateDescription = TextEditingController();

  final newIdeaFormKey = GlobalKey<FormState>();

  AddNewIdeaPage({Key? key}) : super(key: key);

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
                          hintLabel: 'idea',
                          controller: controllerInspirateTitle,
                          hintText: 'Write...',
                          textfieldKey: 'idea',
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        TextFieldApp(
                          hintLabel: 'description',
                          controller: controllerInspirateDescription,
                          hintText: 'Go on...',
                          textfieldKey: 'description',
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
                    child: ListTile(
                      title: Text(notes[index].title),
                      subtitle: Text(notes[index].description),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), 
                      side: BorderSide(color: Colors.grey.shade400, width: 2) ),
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
                    isConcluded: false,
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
