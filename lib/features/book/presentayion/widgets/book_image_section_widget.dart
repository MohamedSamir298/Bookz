import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets_constants.dart';
import '../../../home/domain/entities/book_entity.dart';

class BookImageSectionWidget extends StatelessWidget {
  const BookImageSectionWidget({
    super.key,
    required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
        child: CachedNetworkImage(
          imageUrl: book.bookImageUrl,
          fit: BoxFit.contain,
          height: .45.sh,
          placeholder: (context, url) {
            return Image.asset(AssetsConstants.bookCoverImage, fit: BoxFit.fill);
          },
        ),
      ),
    );
  }
}