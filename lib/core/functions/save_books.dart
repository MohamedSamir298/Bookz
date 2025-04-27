import 'package:hive_ce/hive.dart';

import '../../features/home/domain/entities/book_entity.dart';
import '../ui_helpers/custom_shared_widgets/custom_print.dart';

void saveBooksData(List<BookEntity> books, String boxName) async {
  try {
    var box = await Hive.openBox<BookEntity>(boxName);

    // Adding books using their 'id' as the unique key
    for (var book in books) {
      if (!box.containsKey(book.bookId)) {
        box.put(book.bookId, book);
      }
    }

    print('Box Values: ${box.values}');
  } catch (e) {
    ePrint(e);
  }
}
