import 'package:bookz_app/features/home/presentation/widgets/list_grid_builder_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors_constants.dart';
import '../cubit/home_cubit.dart';

class BooksViewWidget extends StatefulWidget {
  const BooksViewWidget({super.key});

  @override
  State<BooksViewWidget> createState() => _BooksViewWidgetState();
}

class _BooksViewWidgetState extends State<BooksViewWidget> {
  bool isListView = false;

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
                Text('Popular Books', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
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
          Expanded(child: ListGridBuilderWidget(isListView: isListView)),
        ],
      ),
    );
  }
}
