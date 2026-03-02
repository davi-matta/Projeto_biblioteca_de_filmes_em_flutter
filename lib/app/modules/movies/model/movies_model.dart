class Movie {
  final String? id;
  final String title;
  final String description;
  final String directors;
  final String synopsis;
  final String? imageBase64;

  Movie({
    this.id,
    required this.title,
    required this.description,
    required this.directors,
    required this.synopsis,
    this.imageBase64,
  });

  