import 'dart:convert';

class AnimeModel {
  int animeId;
  String animeName;
  String animeImage;

  AnimeModel({
    required this.animeId,
    required this.animeName,
    required this.animeImage,
  });



  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'animeId': animeId});
    result.addAll({'animeName': animeName});
    result.addAll({'animeImage': animeImage});
  
    return result;
  }

  factory AnimeModel.fromMap(Map<String, dynamic> map) {
    return AnimeModel(
      animeId: map['anime_id']?.toInt() ?? 0,
      animeName: map['anime_name'] ?? '',
      animeImage: map['anime_img'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimeModel.fromJson(String source) => AnimeModel.fromMap(json.decode(source));
}
