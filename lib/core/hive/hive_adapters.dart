import 'package:bookz_app/features/home/domain/entities/book_entity.dart';
import 'package:hive_ce/hive.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<BookEntity>()])
// Annotations must be on some element
// ignore: unused_element
void _() {}