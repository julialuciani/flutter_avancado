class NoteModel {
  String title;
  String? description;
  bool isConcluded;
  
  NoteModel({
    required this.title,
    this.description,
    this.isConcluded = false,
  });
}
