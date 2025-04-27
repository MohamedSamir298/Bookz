import 'package:bookz_app/features/home/domain/entities/book_entity.dart';

/// Represents a single book author.
class Author {
  final String name;
  final int? birthYear;
  final int? deathYear;

  Author({required this.name, this.birthYear, this.deathYear});

  factory Author.fromJson(Map<String, dynamic> json) =>
      Author(name: json['name'] as String? ?? '', birthYear: json['birth_year'] as int?, deathYear: json['death_year'] as int?);

  Map<String, dynamic> toJson() => {'name': name, 'birth_year': birthYear, 'death_year': deathYear};
}

/// Holds the various format URLs for a book.
class Formats {
  final String imageJpeg;

  Formats({required this.imageJpeg});

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(imageJpeg: json['image/jpeg'] as String? ?? '');

  Map<String, dynamic> toJson() => {'image/jpeg': imageJpeg};
}

/// Joins a list of [Author] into a comma-separated string.
String _authorsToString(List<Author> authors) => authors.map((a) => a.name).where((n) => n.isNotEmpty).join(', ');

/// Concrete model for a book, extending the domain [BookEntity].
class BookModel extends BookEntity {
  final int id;
  final String title;
  final List<Author> authors;
  final List<String> summaries;
  final Formats formats;

  BookModel({required this.id, required this.title, required this.authors, required this.summaries, required this.formats})
    : super(
        bookId: id,
        bookTitle: title,
        bookAuthors: _authorsToString(authors),
        bookDescription: summaries.isNotEmpty ? summaries.first : '',
        bookImageUrl: formats.imageJpeg,
      );

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final rawAuthors = json['authors'] as List<dynamic>?;
    final rawSummaries = json['summaries'] as List<dynamic>?;

    return BookModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      authors: rawAuthors != null ? rawAuthors.cast<Map<String, dynamic>>().map((m) => Author.fromJson(m)).toList() : <Author>[],
      summaries: rawSummaries != null ? rawSummaries.cast<String>() : <String>[],
      formats: json['formats'] != null ? Formats.fromJson(json['formats'] as Map<String, dynamic>) : Formats(imageJpeg: ''),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'authors': authors.map((a) => a.toJson()).toList(),
    'summaries': summaries,
    'formats': formats.toJson(),
  };
}
