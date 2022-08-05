import 'dart:convert';

class TextModel {
int userId;
int id;
String title;
String body;

  TextModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });


  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'userId': userId});
    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'body': body});
  
    return result;
  }

  factory TextModel.fromMap(Map<String, dynamic> map) {
    return TextModel(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TextModel.fromJson(String source) => TextModel.fromMap(json.decode(source));
}
