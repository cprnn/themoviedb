class Genres {
  final int id;
  final String name;

  Genres({required this.id, required this.name});

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
        id: json['id'] as int, name: json['original_language'] as String);
  }
}
