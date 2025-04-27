import 'package:bookz_app/features/book/presentayion/views/book_details_Screen.dart';
import 'package:bookz_app/features/home/presentation/views/home_screen.dart';
import 'package:bookz_app/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:bookz_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookz_app/router/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/home/domain/entities/book_entity.dart';
import '../features/home/presentation/cubit/home_cubit.dart';
import '../features/search/presentation/views/search_screen.dart';
import '../features/splash/presentation/views/splash_screen.dart';

class AppRouter {
  static GoRoute _splashScreenPageRouteBuilder() {
    return GoRoute(
      path: RoutesConstants.splashScreenRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    );
  }

  static GoRoute _onbaordingScreenPageRouteBuilder() {
    return GoRoute(
      path: RoutesConstants.onboardingScreenRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
    );
  }

  static GoRoute _homeScreenPageRouteBuilder() {
    return GoRoute(
      path: RoutesConstants.homeScreenRoute,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(create: (_) => HomeCubit()..fetchHomePopularBooks(), child: const HomeScreen());
      },
    );
  }

  static GoRoute _searchScreenPageRouteBuilder() {
    return GoRoute(
      path: RoutesConstants.searchScreenRoute,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(create: (context) => SearchCubit(), child: SearchScreen());
      },
    );
  }

  static GoRoute _bookDetailsScreenPageRouteBuilder() {
    return GoRoute(
      path: RoutesConstants.bookDetailsScreenRoute,
      builder: (BuildContext context, GoRouterState state) {
        return BookDetailsScreen(book: state.extra as BookEntity);
      },
    );
  }

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      _splashScreenPageRouteBuilder(),
      _onbaordingScreenPageRouteBuilder(),
      _homeScreenPageRouteBuilder(),
      _searchScreenPageRouteBuilder(),
      _bookDetailsScreenPageRouteBuilder()
    ],
  );
}
