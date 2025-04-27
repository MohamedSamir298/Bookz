import 'package:bookz_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookz_app/features/search/presentation/widgets/search_list_grid_builder_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors_constants.dart';

class SearchResultViewWidget extends StatefulWidget {
  const SearchResultViewWidget({super.key});

  @override
  State<SearchResultViewWidget> createState() => _SearchResultViewWidgetState();
}

class _SearchResultViewWidgetState extends State<SearchResultViewWidget> {
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Search Result', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isListView = !isListView;
                    });
                  },
                  icon: Icon(isListView ? Icons.list : Icons.grid_view_rounded, size: 25.r),
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
          Divider(thickness: 1, color: ColorsConstants.kTertiaryColor1),
          Expanded(child: SearchListGridBuilderWidget(isListView: isListView)),
          Spacer(),
          if(context.read<SearchCubit>().state.isPaginationLoading) const Center(child: CupertinoActivityIndicator())
        ],
      ),
    );
  }
}
