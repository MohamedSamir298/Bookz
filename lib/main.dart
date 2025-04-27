import 'dart:io';

import 'package:bookz_app/core/constants/app_constants.dart';
import 'package:bookz_app/core/hive/hive_registrar.g.dart';
import 'package:bookz_app/core/services/hive_cache_services.dart';
import 'package:bookz_app/core/services/services_locator.dart';
import 'package:bookz_app/core/ui_helpers/app_theme/app_theme.dart';
import 'package:bookz_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';

import 'features/home/domain/entities/book_entity.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initServicesLocator();
  await sl<HiveServices>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme()
        );
      }
    );
  }
}