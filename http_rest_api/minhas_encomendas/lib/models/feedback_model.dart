import 'dart:convert';

class FeedBackModel {
  String feedbackType;
  String feedback;
  String entityId;
  
  FeedBackModel({
    required this.feedbackType,
    required this.feedback,
    required this.entityId,
  });



  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'feedbackType': feedbackType});
    result.addAll({'feedback': feedback});
    result.addAll({'entityId': entityId});
  
    return result;
  }

  factory FeedBackModel.fromMap(Map<String, dynamic> map) {
    return FeedBackModel(
      feedbackType: map['feedbackType'] ?? '',
      feedback: map['feedback'] ?? '',
      entityId: map['entityId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedBackModel.fromJson(String source) => FeedBackModel.fromMap(json.decode(source));
}
