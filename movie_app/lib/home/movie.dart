import 'dart:convert';

class Movie {
  String title;
  String posterPath;
  Movie({
    this.title,
    this.posterPath,
});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': posterPath,
    };
  }

  factory Movie.fromMap(Map<String, dynamic>, map) {
    if (map == null) return null;

    return Movie(
      title: map['title'],
      posterPath: map['posterPath'],
    );
  }

  String toJson() => json.encode(toMap());
}