class MovieModel {
  String id;
  String title;
  String originalTitle;
  String originalTitleRomanised;
  String image;
  String movieBanner;
  String description;
  String director;
  String producer;
  String releaseDate;
  String runningTime;
  String rtScore;

  MovieModel(
      {required this.id,
      required this.title,
      required this.originalTitle,
      required this.originalTitleRomanised,
      required this.image,
      required this.movieBanner,
      required this.description,
      required this.director,
      required this.producer,
      required this.releaseDate,
      required this.runningTime,
      required this.rtScore});

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      title: map['title'],
      originalTitle: map['original_title'],
      description: map['description'],
      director: map['director'],
      image: map['image'],
      movieBanner: map['movie_banner'],
      originalTitleRomanised: map['original_title_romanised'],
      producer: map['producer'],
      releaseDate: map['release_date'],
      rtScore: map['rt_score'],
      runningTime: map['running_time'],
    );
  }
}
