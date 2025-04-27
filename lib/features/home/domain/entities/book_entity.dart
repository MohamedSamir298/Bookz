import 'package:hive_ce/hive.dart';
class BookEntity extends HiveObject{
  final int bookId;
  final String bookTitle;
  final String bookAuthors;
  final String bookDescription;
  final String bookImageUrl;

  BookEntity({required this.bookId, required this.bookTitle, required this.bookAuthors, required this.bookDescription, required this.bookImageUrl});
}
