import 'package:bookz_app/core/constants/assets_constants.dart';
import 'package:bookz_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookz_app/features/home/presentation/cubit/home_state.dart';
import 'package:bookz_app/features/home/presentation/widgets/home_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leadingWidth: 72.w,
        leading: Padding(padding: EdgeInsetsDirectional.only(start: 24.w), child: SvgPicture.asset(AssetsConstants.appbarMenuIcon)),
        actions: [Padding(padding: EdgeInsets.symmetric(horizontal: 24.w), child: SvgPicture.asset(AssetsConstants.appbarNotificationIcon))],
      ),
      body: const HomeBodyWidget(),
    );
  }
}
