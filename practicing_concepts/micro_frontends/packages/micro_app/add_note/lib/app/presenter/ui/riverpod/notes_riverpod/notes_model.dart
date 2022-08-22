class NoteModel {
  String title;
  String description;
  bool isConcluded;
  NoteModel({
    required this.title,
    required this.description,
    this.isConcluded = false,
  });
}