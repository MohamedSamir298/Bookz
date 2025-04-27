import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import '../../../../core/constants/colors_constants.dart';
import '../../../home/domain/entities/book_entity.dart';
import 'book_image_section_widget.dart';

class BookDetailsScreenBodyWidget extends StatelessWidget {
  final BookEntity book;
  const BookDetailsScreenBodyWidget({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookImageSectionWidget(book: book),
                SizedBox(height: 20.h),
                Text(
                  book.bookTitle,
                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
                if (book.bookAuthors.isNotEmpty) ...[
                  SizedBox(height: 5.h),
                  Text('By ${book.bookAuthors}', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                ],

                if (book.bookDescription.isNotEmpty) ...[
                  SizedBox(height: 20.h),
                  Text('Description', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                  SizedBox(height: 5.h),
                  ReadMoreText(
                    book.bookDescription,
                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis),
                    trimLines: 3,
                    colorClickableText: ColorsConstants.kPrimaryColor1,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'See more',
                    trimExpandedText: 'See less',
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
