import 'package:bookz_app/features/search/presentation/widgets/search_result_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../router/routes_constants.dart';
import '../../../../core/ui_helpers/custom_shared_widgets/custom_search_bar_widget.dart';
import 'books_view_widget.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({super.key});

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Column(
        spacing: 15.h,
        children: [
          InkWell(
            onTap: (){
              context.push(RoutesConstants.searchScreenRoute);
            },
            child: IgnorePointer(
              ignoring: true,
              child: CustomSearchBarWidget(
                controller: SearchController(),
                onTap: () {},
                onChanged: (v){},
                onSubmitted: (v){},
                onTapOutside: (_) {},
                hintText: 'Search book',
              ),
            ),
          ),
          const BooksViewWidget(),
        ],
      ),
    );
  }
}
