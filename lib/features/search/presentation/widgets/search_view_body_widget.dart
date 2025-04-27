import 'package:bookz_app/core/ui_helpers/custom_shared_widgets/custom_search_bar_widget.dart';
import 'package:bookz_app/features/search/presentation/widgets/search_result_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../cubit/search_cubit.dart';

class SearchViewBodyWidget extends StatefulWidget {
  const SearchViewBodyWidget({super.key});

  @override
  State<SearchViewBodyWidget> createState() => _SearchViewBodyWidgetState();
}

class _SearchViewBodyWidgetState extends State<SearchViewBodyWidget> {
  SearchController controller = SearchController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Column(
        spacing: 15.h,
        children: [
          CustomSearchBarWidget(
            controller: controller,
            autoFocus: true,
            hasFilterIcon: false,
            onTap: () {},
            onChanged: (v) {},
            onSubmitted: (v) {
              if(v.isNotEmpty){
                context.read<SearchCubit>().searchBooks(keyword: v);
              }
            },
            onTapOutside: (_) {
              FocusManager.instance.primaryFocus?.unfocus();
              SystemChannels.textInput.invokeMethod('TextInput.hide');
              if (controller.text.trim().isEmpty) {
                context.pop();
              }
            },
            hintText: 'Search book',
          ),
          const SearchResultViewWidget()
        ],
      ),
    );
  }
}
