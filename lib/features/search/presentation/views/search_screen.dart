import 'package:bookz_app/features/search/presentation/widgets/search_view_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/assets_constants.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        leadingWidth: 72.w,
        leading: Padding(
          padding: EdgeInsetsDirectional.only(start: 24.w),
          child: GestureDetector(onTap: () => context.pop(), child: SvgPicture.asset(AssetsConstants.appbarBackIcon)),
        ),
        actions: [Padding(padding: EdgeInsets.symmetric(horizontal: 24.w), child: SvgPicture.asset(AssetsConstants.appbarMoreIcon))],
      ),
      body: const SearchViewBodyWidget(),
    );
  }
}
