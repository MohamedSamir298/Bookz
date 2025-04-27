import 'package:bookz_app/core/hive/hive_registrar.g.dart';
import 'package:bookz_app/features/home/domain/entities/book_entity.dart';
import 'package:hive_ce_flutter/adapters.dart';

import '../constants/app_constants.dart';

class HiveServices {
  late Box<BookEntity> popularBox;
  late Box<BookEntity> searchBox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapters();
    popularBox = await Hive.openBox<BookEntity>(AppConstants.hivePopularBoxName);
    searchBox = await Hive.openBox<BookEntity>(AppConstants.hiveSearchBoxName);
  }

  Future<void> clearPopularBox() async {
    await popularBox.clear();
  }
  Future<void> clearSearchBox() async {
    await searchBox.clear();
  }
}
