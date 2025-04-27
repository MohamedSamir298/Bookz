import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/constants/assets_constants.dart';
import '../../../../core/constants/colors_constants.dart';
import '../../../../router/routes_constants.dart';
import '../../domain/entities/book_entity.dart';

class ListViewBookItem extends StatelessWidget {
  final BookEntity book;
  const ListViewBookItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push(RoutesConstants.bookDetailsScreenRoute, extra: book);
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: book.bookImageUrl,
              fit: BoxFit.contain,
              height: 130.h,
              width: 100.w,
              errorWidget: (context, url, error) => Image.asset(AssetsConstants.bookCoverImage, fit: BoxFit.fill, height: 130.h, width: 100.w),
              placeholder: (context, url) => Image.asset(AssetsConstants.bookCoverImage, fit: BoxFit.fill, height: 130.h, width: 100.w),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Column(
                  spacing: 5.h,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(book.bookTitle, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis), maxLines: 2),
                    if (book.bookAuthors.isNotEmpty) ...[
                      Text('By ${book.bookAuthors}', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
                    ],
                    if (book.bookDescription.isNotEmpty) ...[
                      ReadMoreText(
                        book.bookDescription,
                        style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis),
                        trimLines: 2,
                        preDataText: 'Summary : ',
                        preDataTextStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                        colorClickableText: ColorsConstants.kPrimaryColor1,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'See more',
                        trimExpandedText: 'See less',
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
