/// Data class representing metadata for a list of blog posts.
class Meta {
  /// Default constructor for a metadata object.
  Meta({
    required this.count,
    this.nextPage,
    this.previousPage,
  });

  /// Deserialize a Meta object from a Map
  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      count: json['count'] as int,
      nextPage: json['next_page'] as int?,
      previousPage: json['previous_page'] as int?,
    );
  }

  /// Total number of blog posts
  final int count;

  /// Optional page number for the next page of blog posts
  final int? nextPage;

  /// Optional page number for the previous page of blog posts
  final int? previousPage;

  /// Serialize a Meta object to a Map
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next_page': nextPage,
      'previous_page': previousPage,
    };
  }
}
