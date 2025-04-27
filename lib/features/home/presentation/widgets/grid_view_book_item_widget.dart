import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/assets_constants.dart';
import '../../../../core/constants/colors_constants.dart';
import '../../../../router/routes_constants.dart';
import '../../domain/entities/book_entity.dart';

class GridViewBookItem extends StatelessWidget {
  final BookEntity book;
  const GridViewBookItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push(RoutesConstants.bookDetailsScreenRoute, extra: book);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Column(
              children: [
                CachedNetworkImage(
                  imageUrl: book.bookImageUrl,
                  fit: BoxFit.cover,
                  height: 230.h,
                  placeholder: (context, url) {
                    return Image.asset(AssetsConstants.bookCoverImage, fit: BoxFit.fill, height: 230.h);
                  },
                ),
                Spacer(),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              color: ColorsConstants.kBackgroundColor1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    book.bookTitle,
                    style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}