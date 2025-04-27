import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/assets_constants.dart';
import '../../../home/domain/entities/book_entity.dart';
import '../widgets/book_details_Screen_body_widget.dart';

class BookDetailsScreen extends StatelessWidget {
  final BookEntity book;
  const BookDetailsScreen({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
        leadingWidth: 72.w,
        leading: Padding(
          padding: EdgeInsetsDirectional.only(start: 24.w),
          child: GestureDetector(onTap: () => context.pop(), child: SvgPicture.asset(AssetsConstants.appbarBackIcon)),
        ),
        actions: [Padding(padding: EdgeInsets.symmetric(horizontal: 24.w), child: SvgPicture.asset(AssetsConstants.appbarMoreIcon))],
      ),
      body: BookDetailsScreenBodyWidget(book: book),
    );
  }
}
